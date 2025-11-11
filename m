Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B4C4B521
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 04:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ghbp4y4feDJ//KBVvcXAzNd7g5OzNQQvNeXVHe1W4KA=; b=j8JoUk1SuyLdvrGnl4C2bOuNx8
	bH2b8/otuRT3V7VRfcA+cy8/Jc/fL/bx0Ua470iQlL8BRuymzvAjWk5ToyTrupnVdLcFYU5tHKh9Z
	TcC+MBhqYSIpMLaD350eBveeDVBSuL3+tW/K+pMEt+97ovc56Uqu0ePYQU6N/NLjcIVM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIf3h-0003e5-HW;
	Tue, 11 Nov 2025 03:28:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akiyks@gmail.com>) id 1vIf3f-0003dx-9n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 03:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=; b=eGRU2xDHKjbBTbGdRomIuOEybt
 Vc8sa7qlGTF+c94Od8ZkNzWynRKkd6fqkKjyViWfHovA2tcofocbSooNnLN1SBK09Ift0Y50YK6Mw
 9ijikKZzNt51F/k7LhNpJ0lqDX9jhivyLvywLNfcySWFJOy/52IOYKLJBLC29nRW+XOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=; b=AB+DXwyr0aL8FC4lR3T3dksTQ9
 1o+AENS9IC8i31EfyHh9mvSUvp7A74/0c9fZnMILThbseFVWy44YAPi/NjRsvGbFAtrRui303BLZ0
 MUKlYK8QqvIrhmSVFmRsYcJAemfW7mHaK6ec++yazPR9YGEQ1UG0OIjhnRwQlxdmAl+c=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIf3e-000102-I5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 03:28:39 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29516a36affso36252105ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 19:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762831708; x=1763436508; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=;
 b=RPMcFhtc8zS2aCQmTnoCtnN6GMSVffzH6qVQkTqhl/HMnO63Vr/W35kjGKlfNz+KDq
 0pJnE20hMEU7lUXpo9a54KiLZgRZg5ZTivrduPc6q2m8NwJZKcZK4YRixGG9dy6/ZrGs
 nfBm1hKZu3JG8YnZ1b0T9OzwFW+oGi8KlzSRV/vWPGqy6xxgXiBIgOjNH4mfHrpMEJVA
 BP243/EJFGIXxffSa+sicvYB1vnO5Ut9ouNa8xUoizHv2ITA99nTd/bUPcCpVJhIgUvT
 oE4kDwRizjvLHUK3GhIl1c6lof4Z6NuM9CEeTVAuVet+B0S2FVyVjYlYmCEaSGJflD2f
 93lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762831708; x=1763436508;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=;
 b=as0OioG8S8TefjXf1ewD5riBR4SPL1b+pEWx2RWsUUO99j5KPCmwI8hg9waydoor8z
 q6reLk9dkQZjdZTqZ/rzVMRngKw9fwqznCle03HuOPjLXA4W4/DLVuza3Nf5dEsnUjON
 8hZnhAmZ3pXif/l3zm9NiQTZ0ZwZwHegO/trJgl6WqOaBfIxyIQ5X5Fvmp8uQWBiQdI4
 +lPMBj2MgvtVpeT0gXLS4OkNlAIBko/JngG11blPHmk/D08aoFyn4mUHPt1nt/Le/hkd
 SCK55NE6mk+yejtWDaXaQwmPZkPHWRticqbciysaJ/995yO8xGnXDX81Zbgc7HfpyeMK
 tcIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVic0m3l+DD9h6Ej2ZNTmQeExxwOaEWDZAcc6mpQugGiLGR6obIyuIrPLAW7PVbGNpIUQ91JM0MK4nf2sgHHTQU@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTAT57XrP7StYg868fbbgdTS8pCkvts5YvPmZCc+TgsQdQdJm5
 WGltnlttbhOo0yu1cRT5RwLpACLYAehEMMshZFDR4VMiCqh9dZ7nptCe
X-Gm-Gg: ASbGncuFt4iLGjtVPuX1Mp3lqdAr3REF/OQPcSmVPF31ETDVQG0IzWhTWNjzBqfiXHl
 jM8SHgKAIDa8hJAphnp/DiueaeL8ZQlyqzahIunKMHx4lHhcTIpsMibcI1jFu4SP2uafzyRNeFF
 7WTzVyupoUToHIG/T2fDnLD59X7bNK1dapFPzL/VLzYmILgYIu/VWTdImek3/KGR2k+JdiF83xo
 evbFyV+eq5hTezAe7Hu9TB1IjZE+9sWg/firIy7XfslAmH5vqZZXLGwQO+9BMdyxkzSHNlScmpA
 mLt2eJKu/31Ij8iSC34mVhc5xEGnQSE4XmZPCQtcn4QSMJ4R0XrJXLjjPum6Ovz6gQ864zNVtBx
 FyF8xZ4r8C07NNgHV/c3/bdxFQduhFACayytvAZxIYhK2iP32OYR4m6e3OvVTiP5oasWILTooJo
 6fnjfSvfbIKtiOjkZj/Js6Wx1/SGI7Cz4beNgXag657ab1q4GzY45ebjfT
X-Google-Smtp-Source: AGHT+IEsqSgvnp4g7IL4+htc9J2RSl9i6k2BLfkSYr1KEs4TwmlJTB5tNVwK9T1T1vD82tjFfhEQNw==
X-Received: by 2002:a17:902:ec90:b0:295:560a:e474 with SMTP id
 d9443c01a7336-297e56c9f49mr144165115ad.32.1762831707718; 
 Mon, 10 Nov 2025 19:28:27 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651ca4262sm164545005ad.86.2025.11.10.19.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 19:28:27 -0800 (PST)
Message-ID: <1c742563-5408-4fe1-b122-8a7a14cf737f@gmail.com>
Date: Tue, 11 Nov 2025 12:28:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251109095416.2428351-1-nogunix@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi again, On Sun, 9 Nov 2025 18:54:16 +0900, Masaharu Noguchi
 wrote: > Sphinx LaTeX builder fails with the following error when it tries
 to > turn the ASCII tables in f2fs.rst into nested longtables: > > Markup
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [akiyks(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIf3e-000102-I5
Subject: Re: [f2fs-dev] [PATCH v2] Documentation: f2fs: wrap tables in
 literal code blocks
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi again,

On Sun,  9 Nov 2025 18:54:16 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.
> 
> Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
> builder already handles these nested tables. I still want to fix the
> current documentation because Sphinx 8.3 is not released yet, and the
> LaTeX build on the stable 8.2.x series (which also requires
> "docutils<0.22" for now) remains broken without this change.
> 
> Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
> Changes in v2:
>  - wrap the compression level table in a literal block and add the
>    missing blank lines so docutils no longer warns about malformed
>    tables
>  - consistently use ``.. code-block:: none`` for the other ASCII tables
>    that previously triggered the LaTeX error
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index a8d02fe5be83..07b8e752476d 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -188,34 +188,36 @@ fault_type=%d		 Support configuring fault injection type, should be
>  			 enabled with fault_injection option, fault type value
>  			 is shown below, it supports single or combined type.
>  
> -			 ===========================      ==========
> -			 Type_Name                        Type_Value
> -			 ===========================      ==========
> -			 FAULT_KMALLOC                    0x00000001
> -			 FAULT_KVMALLOC                   0x00000002
> -			 FAULT_PAGE_ALLOC                 0x00000004
> -			 FAULT_PAGE_GET                   0x00000008
> -			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
> -			 FAULT_ALLOC_NID                  0x00000020
> -			 FAULT_ORPHAN                     0x00000040
> -			 FAULT_BLOCK                      0x00000080
> -			 FAULT_DIR_DEPTH                  0x00000100
> -			 FAULT_EVICT_INODE                0x00000200
> -			 FAULT_TRUNCATE                   0x00000400
> -			 FAULT_READ_IO                    0x00000800
> -			 FAULT_CHECKPOINT                 0x00001000
> -			 FAULT_DISCARD                    0x00002000
> -			 FAULT_WRITE_IO                   0x00004000
> -			 FAULT_SLAB_ALLOC                 0x00008000
> -			 FAULT_DQUOT_INIT                 0x00010000
> -			 FAULT_LOCK_OP                    0x00020000
> -			 FAULT_BLKADDR_VALIDITY           0x00040000
> -			 FAULT_BLKADDR_CONSISTENCE        0x00080000
> -			 FAULT_NO_SEGMENT                 0x00100000
> -			 FAULT_INCONSISTENT_FOOTER        0x00200000
> -			 FAULT_TIMEOUT                    0x00400000 (1000ms)
> -			 FAULT_VMALLOC                    0x00800000
> -			 ===========================      ==========
> +			 .. code-block:: none
> +
> +			     ===========================      ==========
> +			     Type_Name                        Type_Value
> +			     ===========================      ==========
> +			     FAULT_KMALLOC                    0x00000001
> +			     FAULT_KVMALLOC                   0x00000002
> +			     FAULT_PAGE_ALLOC                 0x00000004
> +			     FAULT_PAGE_GET                   0x00000008
> +			     FAULT_ALLOC_BIO                  0x00000010 (obsolete)
> +			     FAULT_ALLOC_NID                  0x00000020
> +			     FAULT_ORPHAN                     0x00000040
> +			     FAULT_BLOCK                      0x00000080
> +			     FAULT_DIR_DEPTH                  0x00000100
> +			     FAULT_EVICT_INODE                0x00000200
> +			     FAULT_TRUNCATE                   0x00000400
> +			     FAULT_READ_IO                    0x00000800
> +			     FAULT_CHECKPOINT                 0x00001000
> +			     FAULT_DISCARD                    0x00002000
> +			     FAULT_WRITE_IO                   0x00004000
> +			     FAULT_SLAB_ALLOC                 0x00008000
> +			     FAULT_DQUOT_INIT                 0x00010000
> +			     FAULT_LOCK_OP                    0x00020000
> +			     FAULT_BLKADDR_VALIDITY           0x00040000
> +			     FAULT_BLKADDR_CONSISTENCE        0x00080000
> +			     FAULT_NO_SEGMENT                 0x00100000
> +			     FAULT_INCONSISTENT_FOOTER        0x00200000
> +			     FAULT_TIMEOUT                    0x00400000 (1000ms)
> +			     FAULT_VMALLOC                    0x00800000
> +			     ===========================      ==========
>  mode=%s			 Control block allocation mode which supports "adaptive"
>  			 and "lfs". In "lfs" mode, there should be no random
>  			 writes towards main area.
> @@ -296,14 +298,15 @@ nocheckpoint_merge	 Disable checkpoint merge feature.
>  compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
>  			 "lz4", "zstd" and "lzo-rle" algorithm.
>  compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
> -			 "lz4" and "zstd" support compress level config.
> -
> -                         =========      ===========
> -			 algorithm	level range
> -                         =========      ===========
> -			 lz4		3 - 16
> -			 zstd		1 - 22
> -                         =========      ===========
> +			 "lz4" and "zstd" support compress level config::
> +
> +				 =========      ===========
> +				 algorithm	level range
> +				 =========      ===========
> +				 lz4		3 - 16
> +				 zstd		1 - 22
> +				 =========      ===========
> +
>  compress_log_size=%u	 Support configuring compress cluster size. The size will
>  			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
>  compress_extension=%s	 Support adding specified extension, so that f2fs can enable
> @@ -368,38 +371,42 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>  			 the partition in read-only mode. By default it uses "continue"
>  			 mode.
>  
> -			 ====================== =============== =============== ========
> -			 mode			continue	remount-ro	panic
> -			 ====================== =============== =============== ========
> -			 access ops		normal		normal		N/A
> -			 syscall errors		-EIO		-EROFS		N/A
> -			 mount option		rw		ro		N/A
> -			 pending dir write	keep		keep		N/A
> -			 pending non-dir write	drop		keep		N/A
> -			 pending node write	drop		keep		N/A
> -			 pending meta write	keep		keep		N/A
> -			 ====================== =============== =============== ========
> +			 .. code-block:: none
> +
> +			     ====================== =============== =============== ========
> +			     mode			continue	remount-ro	panic
> +			     ====================== =============== =============== ========
> +			     access ops		normal		normal		N/A
> +			     syscall errors		-EIO		-EROFS		N/A
> +			     mount option		rw		ro		N/A
> +			     pending dir write	keep		keep		N/A
> +			     pending non-dir write	drop		keep		N/A
> +			     pending node write	drop		keep		N/A
> +			     pending meta write	keep		keep		N/A
> +			     ====================== =============== =============== ========
>  nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
>  			 by default it's disabled.
>  lookup_mode=%s		 Control the directory lookup behavior for casefolded
>  			 directories. This option has no effect on directories
>  			 that do not have the casefold feature enabled.
>  
> -			 ================== ========================================
> -			 Value		    Description
> -			 ================== ========================================
> -			 perf		    (Default) Enforces a hash-only lookup.
> +			 .. code-block:: none
> +
> +			     ================== ========================================
> +			     Value		    Description
> +			     ================== ========================================
> +			     perf		    (Default) Enforces a hash-only lookup.
>  					    The linear search fallback is always
>  					    disabled, ignoring the on-disk flag.
> -			 compat		    Enables the linear search fallback for
> +			     compat		    Enables the linear search fallback for
>  					    compatibility with directory entries
>  					    created by older kernel that used a
>  					    different case-folding algorithm.
>  					    This mode ignores the on-disk flag.
> -			 auto		    F2FS determines the mode based on the
> +			     auto		    F2FS determines the mode based on the
>  					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
>  					    flag.
> -			 ================== ========================================
> +			     ================== ========================================
>  ======================== ============================================================
>  
>  Debugfs Entries

My R-b tag was sent without inspecting the source .rst after the change.

Using TABs inside ASCII tables degrades their readability.

Masaharu, can you consider applying follow-up change below, which replaces
TABs with white spaces except for the leading ones, and submit a v3?

Thanks, Akira

---------8<---------8<---------8<---------8<---------8<---------8<---------8<-------
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 07b8e752476d..fbe9f8d35366 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -374,15 +374,15 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 .. code-block:: none
 
 			     ====================== =============== =============== ========
-			     mode			continue	remount-ro	panic
+			     mode                   continue        remount-ro      panic
 			     ====================== =============== =============== ========
-			     access ops		normal		normal		N/A
-			     syscall errors		-EIO		-EROFS		N/A
-			     mount option		rw		ro		N/A
-			     pending dir write	keep		keep		N/A
-			     pending non-dir write	drop		keep		N/A
-			     pending node write	drop		keep		N/A
-			     pending meta write	keep		keep		N/A
+			     access ops             normal          normal          N/A
+			     syscall errors         -EIO            -EROFS          N/A
+			     mount option           rw              ro              N/A
+			     pending dir write      keep            keep            N/A
+			     pending non-dir write  drop            keep            N/A
+			     pending node write     drop            keep            N/A
+			     pending meta write     keep            keep            N/A
 			     ====================== =============== =============== ========
 nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
 			 by default it's disabled.
@@ -393,19 +393,19 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			 .. code-block:: none
 
 			     ================== ========================================
-			     Value		    Description
+			     Value              Description
 			     ================== ========================================
-			     perf		    (Default) Enforces a hash-only lookup.
-					    The linear search fallback is always
-					    disabled, ignoring the on-disk flag.
-			     compat		    Enables the linear search fallback for
-					    compatibility with directory entries
-					    created by older kernel that used a
-					    different case-folding algorithm.
-					    This mode ignores the on-disk flag.
-			     auto		    F2FS determines the mode based on the
-					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
-					    flag.
+			     perf               (Default) Enforces a hash-only lookup.
+			                        The linear search fallback is always
+			                        disabled, ignoring the on-disk flag.
+			     compat             Enables the linear search fallback for
+			                        compatibility with directory entries
+			                        created by older kernel that used a
+			                        different case-folding algorithm.
+			                        This mode ignores the on-disk flag.
+			     auto               F2FS determines the mode based on the
+			                        on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
+			                        flag.
 			     ================== ========================================
 ======================== ============================================================
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
