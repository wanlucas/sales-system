import axios, { AxiosRequestConfig, AxiosResponse } from "axios";

const axiosInstance = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1",
  withCredentials: true,
});

axiosInstance.interceptors.response.use(
  (response) => response.data,
);

const DEFAULT_MESSAGE = "Ops! Algo deu errado!";

const DEFAULT_ERROR_MESSAGES: Record<number, string> = {
  400: "Requisição inválida.",
  401: "Não autorizado.",
  403: "Proibido.",
  404: "Recurso não encontrado.",
  500: DEFAULT_MESSAGE,
};

export interface ApiResponse<T = unknown> {
  data?: T;
  error?: string;
  status: number;
}

function formatResponse<T>(response: AxiosResponse<T>): ApiResponse<T> {
  return {
    data: response.data,
    status: response.status,
  };
}

function formatError<T = unknown>(
  error: unknown,
  messages: Record<number, string> = {}
): ApiResponse<T> {
  if (axios.isAxiosError(error)) {
    const status = error.response?.status || 500;

    return {
      status,
      error: messages[status] || DEFAULT_ERROR_MESSAGES[status] || DEFAULT_MESSAGE,
    };
  }

  return {
    status: 500,
    error: DEFAULT_MESSAGE,
  };
}

const api = {
  async get<T = unknown>(
    url: string,
    messages?: Record<number, string>,
    config?: AxiosRequestConfig,
  ): Promise<ApiResponse<T>> {
    try {
      const response = await axiosInstance.get<T>(url, config);
      return formatResponse(response);
    } catch (error) {
      return formatError<T>(error, messages);
    }
  },

  async post<T = unknown>(
    url: string,
    data?: unknown,
    messages?: Record<number, string>,
    config?: AxiosRequestConfig
  ): Promise<ApiResponse<T>> {
    try {
      const response = await axiosInstance.post<T>(url, data, config);
      return formatResponse(response);
    } catch (error) {
      return formatError<T>(error, messages);
    }
  },

  async put<T = unknown>(
    url: string,
    data?: unknown,
    messages?: Record<number, string>,
    config?: AxiosRequestConfig,
  ): Promise<ApiResponse<T>> {
    try {
      const response = await axiosInstance.put<T>(url, data, config);
      return formatResponse(response);
    } catch (error) {
      return formatError<T>(error, messages);
    }
  },

  async patch<T = unknown>(
    url: string,
    data?: unknown,
    messages?: Record<number, string>,
    config?: AxiosRequestConfig,
  ): Promise<ApiResponse<T>> {
    try {
      const response = await axiosInstance.patch<T>(url, data, config);
      return formatResponse(response);
    } catch (error) {
      return formatError<T>(error, messages);
    }
  },

  async delete<T = unknown>(
    url: string,
    messages?: Record<number, string>,
    config?: AxiosRequestConfig,
  ): Promise<ApiResponse<T>> {
    try {
      const response = await axiosInstance.delete<T>(url, config);
      return formatResponse(response);
    } catch (error) {
      return formatError<T>(error, messages);
    }
  },

  instance: axiosInstance,
};

export default api;
