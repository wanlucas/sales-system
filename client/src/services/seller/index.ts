import request from "@/lib/api";
import type { LoginInput } from "./schemas";
import { Seller } from "./types";

export type { LoginInput, RegisterInput } from "./schemas";
export { loginSchema, registerSchema } from "./schemas";

async function login(data: LoginInput) {
  return request.post<Seller>(
    "/sellers/login",
    {
      email: data.email,
      password: data.password,
    },
    {
      401: "Email ou senha inválidos",
    }
  );
}

export default {
  login,
};
