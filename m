Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DD804B2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 08:32:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAPux-0007px-79;
	Tue, 05 Dec 2023 07:32:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1rAPuv-0007pq-JD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 07:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDvHjOceR6WQpYEnRIVAcg5UVxdgwBXUxxT4fneZ/p4=; b=XSAF7am09O3SxEQ+ZwziEZUEDx
 lWD/N4BP37M7RnPvZW18QSRovr5/5zn8k8AzFoaAhTbyRq/LrxAW0Qql9EyRm83CnU0hCkiKoLwob
 zxQki07hgFMSYYE8lqzJeDULkFAmwhRniqc0QZePt+Fg8QXMSe9MPNjRaAf9WdR9xgik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDvHjOceR6WQpYEnRIVAcg5UVxdgwBXUxxT4fneZ/p4=; b=JNA7scShFs3j7YQr1n68Xt3osM
 40inptQBS7Bc4pfcHW0r5+miF4xRYbcYNcU+owKM6mZbEfQJVWV1B34KKaMCw+bdeYtx88ThFVeQ6
 MFN1FabK1B7al/E4qtjjn6cN4oFN1sXtrqyN3Q0kHSW1IYPPOIQQsdS5e8XqLbSRs2I8=;
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rAPuq-0004qt-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 07:32:28 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VxtSpGf_1701761527; 
Received: from 30.97.48.243(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VxtSpGf_1701761527) by smtp.aliyun-inc.com;
 Tue, 05 Dec 2023 15:32:09 +0800
Message-ID: <d7c7ea8c-6e2f-e8d8-88c3-4952c506ed13@linux.alibaba.com>
Date: Tue, 5 Dec 2023 15:32:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
 <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
 <CAD14+f1u6gnHLhGSoQxL9wLq9vDYse+Ac8zxep-O2E8hHreT2w@mail.gmail.com>
 <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
 <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
X-Spam-Score: -12.0 (------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Juhyung, On 2023/12/4 11:41, Juhyung Park wrote: ... >
 >> >> - Could you share the full message about the output of `lscpu`? > >
 Sure: > > Architecture: x86_64 > CPU op-mode(s): 32-bit, 64-bit > Address
 sizes: 39 bits physical, 48 bits virtual > Byt [...] 
 Content analysis details:   (-12.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.101 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rAPuq-0004qt-F1
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Juhyung,

On 2023/12/4 11:41, Juhyung Park wrote:

...
> 
>>
>> - Could you share the full message about the output of `lscpu`?
> 
> Sure:
> 
> Architecture:            x86_64
>    CPU op-mode(s):        32-bit, 64-bit
>    Address sizes:         39 bits physical, 48 bits virtual
>    Byte Order:            Little Endian
> CPU(s):                  8
>    On-line CPU(s) list:   0-7
> Vendor ID:               GenuineIntel
>    BIOS Vendor ID:        Intel(R) Corporation
>    Model name:            11th Gen Intel(R) Core(TM) i7-1185G7 @ 3.00GHz
>      BIOS Model name:     11th Gen Intel(R) Core(TM) i7-1185G7 @ 3.00GHz None CPU
>                            @ 3.0GHz
>      BIOS CPU family:     198
>      CPU family:          6
>      Model:               140
>      Thread(s) per core:  2
>      Core(s) per socket:  4
>      Socket(s):           1
>      Stepping:            1
>      CPU(s) scaling MHz:  60%
>      CPU max MHz:         4800.0000
>      CPU min MHz:         400.0000
>      BogoMIPS:            5990.40
>      Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc
>                           a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss
>                           ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art
>                            arch_perfmon pebs bts rep_good nopl xtopology nonstop_
>                           tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes6
>                           4 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xt
>                           pr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_dead
>                           line_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowp
>                           refetch cpuid_fault epb cat_l2 cdp_l2 ssbd ibrs ibpb st
>                           ibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_
>                           ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
>                            rdt_a avx512f avx512dq rdseed adx smap avx512ifma clfl
>                           ushopt clwb intel_pt avx512cd sha_ni avx512bw avx512vl
>                           xsaveopt xsavec xgetbv1 xsaves split_lock_detect dtherm
>                            ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
>                            hwp_pkg_req vnmi avx512vbmi umip pku ospke avx512_vbmi
>                           2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg tme av
>                           x512_vpopcntdq rdpid movdiri movdir64b fsrm avx512_vp2i

Sigh, I've been thinking.  Here FSRM is the most significant difference between
our environments, could you only try the following diff to see if there's any
difference anymore? (without the previous disable patch.)

diff --git a/arch/x86/lib/memmove_64.S b/arch/x86/lib/memmove_64.S
index 1b60ae81ecd8..1b52a913233c 100644
--- a/arch/x86/lib/memmove_64.S
+++ b/arch/x86/lib/memmove_64.S
@@ -41,9 +41,7 @@ SYM_FUNC_START(__memmove)
  #define CHECK_LEN	cmp $0x20, %rdx; jb 1f
  #define MEMMOVE_BYTES	movq %rdx, %rcx; rep movsb; RET
  .Lmemmove_begin_forward:
-	ALTERNATIVE_2 __stringify(CHECK_LEN), \
-		      __stringify(CHECK_LEN; MEMMOVE_BYTES), X86_FEATURE_ERMS, \
-		      __stringify(MEMMOVE_BYTES), X86_FEATURE_FSRM
+	CHECK_LEN
  
  	/*
  	 * movsq instruction have many startup latency

Thanks,
Gao Xiang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
