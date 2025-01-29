Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1388A21EFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1td8xT-00045r-3Z;
	Wed, 29 Jan 2025 14:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1td8xR-00045j-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 14:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=51TUn5/ks90trMVZXFXIf1x3ahGoUywqkA/5qasa/rE=; b=StTJUWOCWX21HMbUDJ3F7OrtLZ
 L//YZbp8CBZRjavLEVZeXklvhPHlv8NMUR8okP8FpfXsXGZCDeDy/Nw2d/OJ2g3zz0f1hIp1lm2o/
 gfhFs/t/NsOjFAZdxO2tL9eoUnhMyo6cqRIJ2w3fhfn4836JzJF2zbdWzHYc9gudMd6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=51TUn5/ks90trMVZXFXIf1x3ahGoUywqkA/5qasa/rE=; b=JcngYnAw3hO7hpgtRxwZ5wflN/
 iLZzdGQ2XpRTEsLqOY+Ll2g+j+6FmJyDaTOM8K7SWkc+c6Yt/3Fx+eOcscU7cmTp7XsgkWwGC3+Xt
 oVwnDe8rMFLKUnmYTsSm8QDNLuj8FTZ2JoBq1dQP9V4uToB0XxWb7qLf6C39RKhj1q/0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1td8xR-0000ok-JD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 14:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 161445C5CD4;
 Wed, 29 Jan 2025 14:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A63C4CED3;
 Wed, 29 Jan 2025 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160530;
 bh=/uy2KVK+92bnjkNkIT1iw5CrTdiZ0e2lwuNq07xf8OM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=djFiyaI1DlJWiFHE8181GXXxjAr3wEqHuYYG3QsXELwZvDKxnRVxjUbFdIQbTnmLU
 Lt9fufnc/G7WtGz9dtGAS3ZPyc4zzMF7RCfLnP+iBbDKwR+eb444lgkHrtJ/IVzKnP
 WXttUr2Yxs6fWKBISWq0/x5ZYEIrKYg1CFR9lX/xH1tZyDicoyC+ae2lT5AysNsQ5+
 Zrzl0ec3PcPgnqhqfetOvYwj+teyI/gwI8joVAbOMvx/WjRa3zWtMYKccoxnJSJUEq
 elKqiXQFndQZbOtUJb0kgnqPfoQifhZUjqbQYA3D92ZpRy6VKsPv9SGhYwjgHdtLhq
 gPYPXMPtSHgOQ==
Date: Wed, 29 Jan 2025 15:22:03 +0100
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20250129152203.0dda53ca@foz.lan>
In-Reply-To: <20250129024518.69c0be81@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <87h65i7e87.fsf@trenco.lwn.net> <20250129024518.69c0be81@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Em Wed,
 29 Jan 2025 02:45:18 +0100 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 escreveu: > > I've only tested with current Sphinx, > > have you tried this
 with the more ancient versions we support? > > Not yet, but I double-checked
 at Sphinx documentation to be sure that > I won't be usin [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1td8xR-0000ok-JD
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-usb@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-pm@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
 workflows@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Em Wed, 29 Jan 2025 02:45:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> > I've only tested with current Sphinx,
> > have you tried this with the more ancient versions we support?  
> 
> Not yet, but I double-checked at Sphinx documentation to be sure that
> I won't be using any newer methods: I just kept using the same Sphinx
> API as used by other extensions at the Kernel.

Just checked it with Python 3.6 and Sphinx 3.4 on Fedora 41 with:

	sudo dnf install python3.6.x86_64
	python3.6 -m venv Sphinx-3.4
	pip install alabaster Sphinx==3.4.3 pyyaml

There were some issues related to problems with early f-string
support, as reported by Akira.

After applying the enclosed patch, it is now working fine. The only
drawback is here:

	- print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
	+ print("Defined on file(s):\t" + ", ".join(files))

As I removed the file/files auto-plural logic depending on the files
array length. Not a big deal.

I'll double-check if there's no other diff between old/new version
and add the enclosed patch in the end.

Thanks,
Mauro

[PATCH] scripts/get_abi.py: make it backward-compatible with Python 3.6

Despite being introduced on Python 3.6, the original implementation
was too limited: it doesn't accept anything but the argument.

Even on python 3.10.12, support was still limited, as more complex
operations cause SyntaxError:

	Exception occurred:
	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
	    from get_abi import AbiParser
	  File ".../linux/scripts/get_abi.py", line 525
	    msg += f"{part}\n{"-" * len(part)}\n\n"
                       ^
	SyntaxError: f-string: expecting '}'

Replace f-strings by normal string concatenation when it doesn't
work on Python 3.6.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 543bed397c8c..e6e94f721fff 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -522,7 +522,7 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    msg += f"{part}\n{"-" * len(part)}\n\n"
+                    msg += part + "\n"+ "-" * len(part) +"\n\n"
 
                 msg += f".. _{key}:\n\n"
 
@@ -546,7 +546,7 @@ class AbiParser:
                     msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
+                msg += names[0] +"\n" + "-" * len(names[0]) +"\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
@@ -570,7 +570,8 @@ class AbiParser:
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+                users = users.strip("\n").replace('\n', '\n\t')
+                msg += f"Users:\n\t{users}\n\n"
 
             ln = v.get("line_no", 1)
 
@@ -596,7 +597,9 @@ class AbiParser:
                 elif len(lines) == 1:
                     f.append(f"{fname}:{lines[0]}")
                 else:
-                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+                    m = fname + "lines "
+                    m += ", ".join(str(x) for x in lines)
+                    f.append(m)
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
@@ -644,10 +647,11 @@ class AbiParser:
                     if users:
                         print(f"Users:\t\t\t{users}")
 
-                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+                    print("Defined on file(s):\t" + ", ".join(files))
 
                     if desc:
-                        print(f"\n{desc.strip("\n")}\n")
+                        desc = desc.strip("\n")
+                        print(f"\n{desc}\n")
 
         if not found_keys:
             print(f"Regular expression /{expr}/ not found.")


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
