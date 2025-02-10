Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F231A2FA0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 21:28:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thaNf-0002Do-M7;
	Mon, 10 Feb 2025 20:27:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1thaNe-0002Di-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 20:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYy8fjkDA7iBj98dXF/92fNIUiQwOXz7sUb4p7sUfrQ=; b=PZxfUUkC0bzWKvDA1aqzuqhx14
 XmGjRiKMobBDyI3mpcsiZ6RSCA9+y80FA7H9UAv8DqHbsBWTcoi7GQUKhP1G1nEwrMpZTHc59aG/v
 jb8ZZ7nWCKmPoeqHNJowpw6eS0qpEKxojG/qqEcoQp71OOP/Ptv/W9/DOe4C66DHlvU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYy8fjkDA7iBj98dXF/92fNIUiQwOXz7sUb4p7sUfrQ=; b=TWHlf0SbSDAUclwzvTJlN2wMnA
 eT70Af57uR709xlkPOED2ZDWcxcSHnINmgTuegwuHgULumy8n0NFtCAnLF0YmiB2xXenFQUPeBo+I
 iKuQLqPjguWKE9FUau8Ohyzc41EICG284/a3wJr2IRqSfzEMJItoo6BNsniLdDWbq+8M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thaNd-0002FE-65 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 20:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 383745C5C42;
 Mon, 10 Feb 2025 20:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76950C2BCF6;
 Mon, 10 Feb 2025 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739219254;
 bh=cL+PKhmX30jHbo2cscQxptMC1LXNOM5ta/EiQGb3AxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jhVMwDcM9/SfG7eKGrJ0NOuLx75OH78xOzvUpR+PFUGHM8v+dPoeQuEDegreBWCEC
 ytY3qgn2rLt5QA4dVE1Xiu9e32yq7huQ4DFtL7olXxN6buNmlGeo1bfH5XsSR3+Pww
 MGbEkDiwKDUIxyT6VwJz5/wjAmC8r6dpHDx1afCb7BDarebp36qgepsjiO+D9xnfR0
 LJsk1JF2OmG52TgcGkTeN7HcTM2vardQlhBSpFVDy9YMgGsSk/DJYW2pbE+bGsjAWO
 4ymoWJ3ctbLei7RMhAsVu/lFtCSzoDkXgDhSdNbRINaHNVt0MtEy2Y8dtf3YsCCVu1
 c5NTpup6CIKBQ==
Date: Mon, 10 Feb 2025 21:27:28 +0100
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20250210212728.64667005@foz.lan>
In-Reply-To: <87h651zm7d.fsf@trenco.lwn.net>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
 <87h651zm7d.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Em Mon,
 10 Feb 2025 11:30:46 -0700 Jonathan Corbet <corbet@lwn.net>
 escreveu: > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes: > >
 > Hi Jon/Greg, > > > > This series replace get_abi.pl with a Python version.
 > > > > I originally started it due to some issues I notice [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thaNd-0002FE-65
Subject: Re: [f2fs-dev] [PATCH 00/27] Improve ABI documentation generation
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
Cc: Tony Luck <tony.luck@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org,
 coresight@lists.linaro.org, Johannes Berg <johannes@sipsolutions.net>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Em Mon, 10 Feb 2025 11:30:46 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon/Greg,
> >
> > This series replace get_abi.pl with a Python version.
> >
> > I originally started it due to some issues I noticed when searching for
> > ABI symbols. While I could just go ahead and fix the already existing
> > script, I noticed that the script maintainance didn't have much care over
> > all those years, probably because it is easier to find Python programmers
> > those days.
> >
> > Also, the code is complex and was not using modules or classes and
> > were using lots of global variables.
> >
> > So, I decided to rewrite it in Python. I started with a manual conversion
> > for each function. Yet, to avoid future maintainership issues, I opted to
> > divide the main code on three classes, each on a sepaparate file.
> >
> > Just like the original RFC, I opted to keep the Sphinx kernel-abi module
> > on three different phases:
> >
> > - call get_abi.py as an exec file;
> > - import AbiParser on a minimal integration scenario;
> > - cleanup the code to avoid needing to parse line numbers from the text.
> >
> > This way, if something goes wrong, it would be easier to just revert any
> > offending patches, It also provides a better rationale about what each
> > logical change is doing.
> >
> > The initial patches on this series do some preparation work and
> > cleans some ABI symbol bugs that lack ":" delimiter.
> >
> > I opted to place on this series the Sphinx and Python version updates.
> >
> > I still have ~10 patches here with additional cleanups, from the original
> > series I sent as RFC but let's get the main changes merged first.  
> 
> OK, I have applied this set - it seems to work for me, though it does
> lead to some changes in the organization of
> Documentation/admin-guide/abi.html in the output.

Yes. I moved the files part to separate files, as IMHO this would
make easier for people to navigate.
 
> It would be nice if, eventually, we could put the README link up at the
> top rather than under "ABI file",

Moving its position is not hard: all we need to do is to change abi.rst
file. See the enclosed patch.

> or even just include its contents
> there directly.


> 
> Anyway, let's see how this goes :)
> 
> Thanks,
> 
> jon

Thanks,
Mauro

From e1b864d1d333d94430420d1d6fc15ea7d8a99b4b Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Mon, 10 Feb 2025 21:24:06 +0100
Subject: [PATCH] docs: ABI: move README contents to the top

The ABI documentation looks a little bit better if it starts
with the contents of the README is placed at the beginning.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/admin-guide/abi-readme-file.rst b/Documentation/admin-guide/abi-readme-file.rst
deleted file mode 100644
index 6172e4ccbda2..000000000000
--- a/Documentation/admin-guide/abi-readme-file.rst
+++ /dev/null
@@ -1,6 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-ABI README
-==========
-
-.. kernel-abi:: README
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index 15a2dcb1388c..2067336353ae 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -4,6 +4,11 @@
 Linux ABI description
 =====================
 
+ABI README
+==========
+
+.. kernel-abi:: README
+
 ABI symbols
 -----------
 
@@ -21,7 +26,6 @@ ABI files
 .. toctree::
    :maxdepth: 2
 
-   abi-readme-file
    abi-stable-files
    abi-testing-files
    abi-obsolete-files



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
