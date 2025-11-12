Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAAC50497
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 03:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5VeIyu6nBb+70zb9fbuzeiw6E1cbaxHdBeUNfr15SU=; b=EZPvdfPfg9x2p6FM1vmu8s/2UC
	79rPY3YUDx31DG+gZwst6rw9Nwd90biFAcIArOe1SN09nxVIJ5Qt1iZYU26qeXkqtv4FHt17JGv/4
	CT60w7nYG8ilHVKyty+2tsIug3N94ZBzlwJ8V0jx2z8zt9w3bJyQZ0SGEa0O+oNbeSGg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJ0Bk-0006vt-JS;
	Wed, 12 Nov 2025 02:02:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akiyks@gmail.com>) id 1vJ0Be-0006vj-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 02:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=; b=V8sg7kfUQQAN4rcOhNKqNpoLon
 KWz/jBxM011pdbXGrmnLFT92ois+NYbxoKeStPQ1Lul0BqVs/P98PU/Najr1bA4GEYDqiXE298oyV
 y32bJKg2DSozhkmRl5K6GQ09KZok9DvFMgHR581FEi7xE8cQ5ziySdYzsek0VVpsfYNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=; b=I0BwGjZuflbJNGrIwCELYS/tos
 iLVPAeRJ2SzHuCVlh4skFlNyMeFlkHqBawotCfR1UML2BOU2FVuhjwfjYrKgC4mTUr4F0FgUD3PZ4
 hC9VyCT54LjHo/PduOko7ezaDirQjYnkd9VtG7mQViS+tng5bZMN1nSXkrlp6yQHqyo8=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vJ0Be-00075Q-3b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 02:02:18 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3437af8444cso302150a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 18:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762912932; x=1763517732; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=;
 b=dDc0pm3wVy8BbqcoxmnkbTbsJ0ZMplEd13k/bi/x1mNExQvAVcGvZhZY8iQOuW1kUz
 +97nyW1q53FXqKeVpw1/HLflHZgWSbqlcEvZyrBev288v6lLOo1/rX6zLJvQIDuE/n7K
 6VprnczH05V/bP4OHXj9MQGNLsBNt1Luo+KBMqctBELWoZheD10oU9Jpm9Fi4+0WUk4W
 +SMGPOQGFGOrLzT2Mx6GKBylgA9KCQJjaoGO71TBDaeZV0Dl2FuGvjbblf8emaYt2fsR
 Tiov528gHoEqHP9+/glsh/X7B/rC9YYlcj4JSXt4RU7vEp4F6P8MeN4gra0lM/B8MfB0
 jiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762912932; x=1763517732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=;
 b=HZP+oQwwF7mdDBuUuPIPsI5QoyEfIt3u1o8/7Y4G9+u+cJCSuhzfOCF2rX0L3AOmtU
 uciR2L4mG7unWJY1hS8Pb1CnsYqRwQfpC4yZ3MK9gpSsLBMLd6code+FWHKB68CE7Csw
 Weq3Nt/MJDA4NUmT6Zv1S7XlDf1JuGI3D4b4nUKAZ55S7rlupwfVxheVFTz+W5y+Y765
 XWimiLAd8zWptGb4PHhDCTCO6Vdvzo+p4W1o/ZSgvBaMfqrUL9BdJ1Vjmzipc1N139O3
 9xA0NjrBxmZl3TtQEGB97r+x21MQN+j/U6a6AgSmDvUy3V7TNq6nBy82GcqCdtWRz5B2
 C0sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbXGMS3bhbYnsGnXT73lhmFPMh9SvlORhO33wegtvyAGzrQ3OgGsaAfzk53niC4tmEv7jLZOczjPD7Bj9mxbv7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxxOmm4atEnW0jg4JgUQGaosVdRQ04imFlJqwxNFzq/wPgUJNx5
 q0EFf8/MEOFrb0QSpT+v/S1HskYvNLiawo2y4OBq2yC8oFs835xgScZJtGNGKQ==
X-Gm-Gg: ASbGncuSDMP9n9JAjeTAtjCzoo6BH5v2kphGwFYX03pyhq2xygY9BvkhRsqrudgZevO
 A62Lsgx9CA5C7serN5awMcJpuEBLyVtLxvL3aWaMkk+r2iq+rL/gPTiVPmlKM3ZELDFZvfTgpny
 cYXjma6iu/pzeJDyVdEXlR9bhe9vhS4MSsvXinnUcqi74dl25ZQ0Tg9U95APnjdXlEP4unz9xl4
 dbPmaDHoFhY6w8oKgr3vR8RhxgkLnD+1tNbUhZA2rl9jqnfRzab90j742ysgdBRzSVM/Wt9bPLV
 0O+9knvho+QcAbnfNu7+1CW2xdcLVxw80ps78PRatVhI0lWGDUFBUnS4oRrgKjFfuVsMknq0PFS
 KVIW1nHmV05Gkqt0J7FlfdC57NWylXlVdroE6gwB5/qsJsua56zWyCxvBCrNZWp67N3Lsbl7cEK
 wYRKun4AB1+P6Q/TwK3h6j1ySbdZ8VuiR5jCyrgv9S1/Jraw==
X-Google-Smtp-Source: AGHT+IF1ePnlT803zhN9t6LCfFB14lxs5sloRSlAbLMSA9+Xfr0NjLTehBWwSN3ANdNbuGK2KXbu5g==
X-Received: by 2002:a17:90b:4a4b:b0:341:8c8e:38b5 with SMTP id
 98e67ed59e1d1-343ddea7bdcmr1291309a91.25.1762912931983; 
 Tue, 11 Nov 2025 18:02:11 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343e0794e56sm522225a91.10.2025.11.11.18.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 18:02:11 -0800 (PST)
Message-ID: <6dfd1276-a30f-4ba0-b2bf-c295d88141b6@gmail.com>
Date: Wed, 12 Nov 2025 11:02:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masaharu Noguchi <nogunix@gmail.com>
References: <20251111130349.3856302-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251111130349.3856302-1-nogunix@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 11 Nov 2025 22:00:39 +0900, Masaharu Noguchi wrote:
 > Hi Akira and Bagas, > > As suggested, I replaced TABs inside the ASCII
 tables with white spaces > for better readability. No other content [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.216.52 listed in list.dnswl.org]
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
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vJ0Be-00075Q-3b
Subject: Re: [f2fs-dev] [PATCH v3] Documentation: f2fs: wrap tables in
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
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 11 Nov 2025 22:00:39 +0900, Masaharu Noguchi wrote:
> Hi Akira and Bagas,
> 
> As suggested, I replaced TABs inside the ASCII tables with white spaces
> for better readability. No other content changes were made.
> 
> Thanks for your reviews and acks.
> 
> Best regards,
> Masaharu Noguchi
> 
> ---

Grumble ...
The above will be the Changelog of this patch.
I don't think that is what you'd like to see.

> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.

Probably, Changelog should end here.

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
> Changes in v3:
>  - Replace TABs inside ASCII tables with white spaces for readability
>  - Keep Reviewed-by and Acked-by tags as the technical content remains unchanged

These background and change history should go out of the Changelog area. 

Please have a look at Documentation/process/submitting-patches.rst,
especially the section "The canonical patch format".

> 
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index a8d02fe5be83..1de0bc83d76e 100644

Well, the hash after this change (1de0bc83d76e) does not match the
one in the diff I suggested (fbe9f8d35366).  Did you make the change
by hand?

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
> +				 algorithm      level range
> +				 =========      ===========
> +				 lz4            3 - 16
> +				 zstd           1 - 22
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
> +			     mode              continue        remount-ro      panic
> +			     ====================== =============== =============== ========
> +			     access ops        normal          normal          N/A
> +			     syscall errors    -EIO            -EROFS          N/A
> +			     mount option      rw              ro              N/A
> +			     pending dir write keep            keep            N/A
> +			     pending non-dir write drop        keep            N/A
> +			     pending node write drop           keep            N/A
> +			     pending meta write keep           keep            N/A
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
> +			     Value            Description
> +			     ================== ========================================
> +			     perf            (Default) Enforces a hash-only lookup.
>  					    The linear search fallback is always
>  					    disabled, ignoring the on-disk flag.
> -			 compat		    Enables the linear search fallback for
> +			     compat          Enables the linear search fallback for
>  					    compatibility with directory entries
>  					    created by older kernel that used a
>  					    different case-folding algorithm.
>  					    This mode ignores the on-disk flag.
> -			 auto		    F2FS determines the mode based on the
> +			     auto            F2FS determines the mode based on the
>  					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
>  					    flag.
> -			 ================== ========================================
> +			     ================== ========================================

Umm, this doesn't look right.  Just build htmldocs and have a look at
how these nested literal tables are rendered.
Sphinx doesn't complain about misaligned cells in literal blocks.

Thanks, Akira


>  ======================== ============================================================
>  
>  Debugfs Entries



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
