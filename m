Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F624B1DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Aug 2020 11:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8geW-0005hz-Cv; Thu, 20 Aug 2020 09:14:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drinkcat@chromium.org>) id 1k8geV-0005hh-TM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 09:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+dDRDonHJvato3rSg9EzeGb5bHUmhRkgiaRA89g5iRE=; b=Zd87Xzx4JIUSRvQp7Eet2zYde8
 8WlfkzJHUKJ7qu3LYUHbiS52Y2GRkBitsvnL0Tq8Cz7QoCUHeGnfY7WuXZdKrdYIt1XygcmnXLDUY
 85qPp3bFF21KoeuM/mZVuYW5HcO8R6zxfPlQD4r/4vwINlrfnFejWSE+wJgnCC3qzyB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+dDRDonHJvato3rSg9EzeGb5bHUmhRkgiaRA89g5iRE=; b=fcRyQC9hJwjJlja2x48tM92NWG
 6He8R9yKwnv7X30BkLbQQv85GW7v7Rgdsjb9PZg9HykmzLYuzOmngYh12C6ZMcZJ19fPwTH8xQpiM
 CAcrBjvW/K9Wgu65nq1msQVQTe8DZA9iCIGwI1Rb0LWaZ32zJpW1Jg7zgCOywhC0rXdk=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k8geU-0028G4-9P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 09:14:31 +0000
Received: by mail-pg1-f193.google.com with SMTP id o13so849757pgf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Aug 2020 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dDRDonHJvato3rSg9EzeGb5bHUmhRkgiaRA89g5iRE=;
 b=aGho0TihztlVcEALtbGufzeFiAShov5uftycOlvLNPpkcGpNdWZYT33Pnog7KCSLuW
 vNDzkydjCfGTyTCD7mZdd7my/ngKd7SezM4jdEepImdhFEdeHZu5yGqhtkC/pZYgkGbO
 01O2UoZR0A9xRT1J/AXYE+olOJpU08TIxhb8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dDRDonHJvato3rSg9EzeGb5bHUmhRkgiaRA89g5iRE=;
 b=HD8HEqrDaDbuKDi0gkLzlgFLpjSSXT7uDAZN5XOp6Fk72n+pBRoH9x/TkJe22z0aTM
 sS/Qv/vHs0gjPZcaW6nLsW5U/cpG8mfFTcofyb+XoSIkTCUDaCUjnE+jpsS9mioz4h2m
 js8xPbSdpf8G3eNqF/nxhOHDylYQ5qhwJELWXWKPeK2+0l2/Wpx3K3+Y84PmDOWQpR/M
 pn5uZZqFkySLG7HFxWgQeyDGYnXcAvEChXI0y92JdWl7IsdmZZ3urPElN8NRE9gxBDfU
 qfbyo/HQ/Z7sSxbMXwhtq8OOMGf3oCq9nvIs9Z0aO0ro/6SAgf5SrJ8fF2YtLtNKcNTK
 tfnQ==
X-Gm-Message-State: AOAM530rKkrOuuZ6xs3hLCanaij1McKXmpKiilFiQ2tj7Ai7MvLb22jr
 u7Ty8f3x9OHuZnSzTiez+2zadQ==
X-Google-Smtp-Source: ABdhPJywcBmh6B4y9LTUDxLhg3ZqPWZTMIB/igrhz0htlivl62N0XB02hWgytplaluoU2tCo9+qCNw==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr1813230pgi.20.1597914864654; 
 Thu, 20 Aug 2020 02:14:24 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o15sm1954448pfu.167.2020.08.20.02.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 02:14:23 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 20 Aug 2020 17:14:11 +0800
Message-Id: <20200820170951.v4.2.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k8geU-0028G4-9P
Subject: [f2fs-dev] [PATCH v4 2/3] kernel/trace: Add TRACING_ALLOW_PRINTK
 config option
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Nicolas Boichat <drinkcat@chromium.org>, Kars Mulder <kerneldev@karsmulder.nl>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Ingo Molnar <mingo@redhat.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

trace_printk is meant as a debugging tool, and should not be
compiled into production code without specific debug Kconfig
options enabled, or source code changes, as indicated by the
warning that shows up on boot if any trace_printk is called:
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **

If this option is set to n, the kernel will generate a
build-time error if trace_printk is used.

Note that the code to handle trace_printk is still present,
so this does not prevent people from compiling out-of-tree
kernel modules with the option set to =y, or BPF programs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

Changes since v2/v3:
 - Rebase only, v3 didn't exist as I just split out the other
   necessary patches.
 - Added patch 3/3 to fix atomisp_compat_css20.c

Changes since v1:
 - Use static_assert instead of __static_assert (Jason Gunthorpe)
 - Fix issues that can be detected by this patch (running some
   randconfig in a loop, kernel test robot, or manual inspection),
   by:
   - Making some debug config options that use trace_printk depend
     on the new config option.
   - Adding 3 patches before this one.

There is a question from Alexei whether the warning is warranted,
and it's possibly too strongly worded, but the fact is, we do
not want trace_printk to be sprinkled in kernel code by default,
unless a very specific Kconfig command is enabled (or preprocessor
macro).

There's at least 3 reasons that I can come up with:
 1. trace_printk introduces some overhead.
 2. If the kernel keeps adding always-enabled trace_printk, it will
    be much harder for developers to make use of trace_printk for
    debugging.
 3. People may assume that trace_printk is for debugging only, and
    may accidentally output sensitive data (theoritical at this
    stage).

 drivers/gpu/drm/i915/Kconfig.debug |  4 ++--
 fs/f2fs/Kconfig                    |  1 +
 include/linux/kernel.h             | 17 ++++++++++++++++-
 kernel/trace/Kconfig               | 10 ++++++++++
 samples/Kconfig                    |  2 ++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 1cb28c20807c59d..fa30f9bdc82311f 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -84,7 +84,7 @@ config DRM_I915_ERRLOG_GEM
 config DRM_I915_TRACE_GEM
 	bool "Insert extra ftrace output from the GEM internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
@@ -98,7 +98,7 @@ config DRM_I915_TRACE_GEM
 config DRM_I915_TRACE_GTT
 	bool "Insert extra ftrace output from the GTT internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index d13c5c6a978769b..d161d96cc1b7418 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -80,6 +80,7 @@ config F2FS_IO_TRACE
 	bool "F2FS IO tracer"
 	depends on F2FS_FS
 	depends on FUNCTION_TRACER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  F2FS IO trace is based on a function trace, which gathers process
 	  information and block IO patterns in the filesystem level.
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 500def620d8f493..7cf24fa16a479ed 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -720,10 +720,15 @@ do {									\
 #define trace_printk(fmt, ...)				\
 do {							\
 	char _______STR[] = __stringify((__VA_ARGS__));	\
+							\
+	static_assert(					\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),\
+		"trace_printk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+							\
 	if (sizeof(_______STR) > 3)			\
 		do_trace_printk(fmt, ##__VA_ARGS__);	\
 	else						\
-		trace_puts(fmt);			\
+		do_trace_puts(fmt);			\
 } while (0)
 
 #define do_trace_printk(fmt, args...)					\
@@ -772,6 +777,13 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
  */
 
 #define trace_puts(str) ({						\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"trace_puts called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+	do_trace_puts(str);						\
+})
+
+#define do_trace_puts(str) ({						\
 	static const char *trace_printk_fmt __used			\
 		__attribute__((section("__trace_printk_fmt"))) =	\
 		__builtin_constant_p(str) ? str : NULL;			\
@@ -793,6 +805,9 @@ extern void trace_dump_stack(int skip);
  */
 #define ftrace_vprintk(fmt, vargs)					\
 do {									\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"ftrace_vprintk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
 		  __attribute__((section("__trace_printk_fmt"))) =	\
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508c99..971b6035b197823 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -111,6 +111,15 @@ config GENERIC_TRACER
 	bool
 	select TRACING
 
+config TRACING_ALLOW_PRINTK
+	bool "Allow trace_printk"
+	default y if DEBUG_KERNEL
+	depends on TRACING
+	help
+	  trace_printk is only meant as a debugging tool. If this option is
+	  set to n, the kernel will generate a build-time error if trace_printk
+	  is used.
+
 #
 # Minimum requirements an architecture has to meet for us to
 # be able to offer generic tracing facilities:
@@ -686,6 +695,7 @@ config TRACEPOINT_BENCHMARK
 config RING_BUFFER_BENCHMARK
 	tristate "Ring buffer benchmark stress tester"
 	depends on RING_BUFFER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  This option creates a test to stress the ring buffer and benchmark it.
 	  It creates its own ring buffer such that it will not interfere with
diff --git a/samples/Kconfig b/samples/Kconfig
index 0ed6e4d71d87b16..6b1ade57f00dd5d 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -19,6 +19,7 @@ config SAMPLE_TRACE_EVENTS
 config SAMPLE_TRACE_PRINTK
         tristate "Build trace_printk module - tests various trace_printk formats"
 	depends on EVENT_TRACING && m
+	depends on TRACING_ALLOW_PRINTK
 	help
 	 This builds a module that calls trace_printk() and can be used to
 	 test various trace_printk() calls from a module.
@@ -26,6 +27,7 @@ config SAMPLE_TRACE_PRINTK
 config SAMPLE_FTRACE_DIRECT
 	tristate "Build register_ftrace_direct() example"
 	depends on DYNAMIC_FTRACE_WITH_DIRECT_CALLS && m
+	depends on TRACING_ALLOW_PRINTK
 	depends on X86_64 # has x86_64 inlined asm
 	help
 	  This builds an ftrace direct function example
-- 
2.28.0.220.ged08abb693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
