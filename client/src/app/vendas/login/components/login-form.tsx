"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Logo } from "@/components/logo";
import { LoginInput, loginSchema } from "@/services/seller";
import services from "@/services";

export function LoginForm() {
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);

  const form = useForm<LoginInput>({
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  });

  async function onSubmit(values: LoginInput) {
    setIsLoading(true);

    const { error } = await services.seller.login(values);

    if (error)
      toast.error("Erro ao fazer login", {
        description: error,
      });
    else {
      toast.success("Login realizado com sucesso!");
      router.push("/dashboard");
    }

    setIsLoading(false);
  }

  return (
    <div className="w-full max-w-md mx-auto space-y-8">
      <div className="flex justify-center">
        <Logo />
      </div>

      <div className="space-y-2 text-center">
        <h1 className="text-3xl font-bold text-primary">Login</h1>
        <p className="text-text">Entre com suas credenciais para acessar</p>
      </div>

      <Form {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
          <FormField
            control={form.control}
            name="email"
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-text-dark">Email</FormLabel>
                <FormControl>
                  <Input
                    placeholder="seu@email.com"
                    type="email"
                    disabled={isLoading}
                    {...field}
                  />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />

          <FormField
            control={form.control}
            name="password"
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-text-dark">Senha</FormLabel>
                <FormControl>
                  <Input
                    placeholder="••••••"
                    type="password"
                    disabled={isLoading}
                    {...field}
                  />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />

          <Button
            type="submit"
            disabled={isLoading}
            className="w-full bg-primary hover:bg-primary-dark text-background"
          >
            {isLoading ? "Entrando..." : "Entrar"}
          </Button>
        </form>
      </Form>

      <div className="text-center text-sm">
        <span className="text-text-dark">Não tem uma conta? </span>
        <a
          href="/register"
          className="text-primary hover:text-primary-dark font-medium"
        >
          Registre-se
        </a>
      </div>
    </div>
  );
}
