Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C29A683D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 14:25:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2rTh-0002bI-5K;
	Mon, 21 Oct 2024 12:25:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hca@linux.ibm.com>) id 1t2rTf-0002b6-TB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 12:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=92knE4jiltiV907EhRGLVYeamkXayI7j0BwYX0ZH1JA=; b=Qau5EYacp3IWdSBlfvSRnJmwOu
 w9u6gelS1QsfzrPQ3mfBvRk3Y44FjQd5dE9UwzZho4BdQ9jv6uvauPJNPZIvcyKAEtjXdvCn3BVbD
 kIwzqqbQ8tYAOdWD27MtbtA2Z6XXP+yBLWx0lS/xrXSKw7UnQvlbrASvqITx1V8oetMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=92knE4jiltiV907EhRGLVYeamkXayI7j0BwYX0ZH1JA=; b=MQ+csflFXxSIKmcxdjEcNauwF+
 O3BDMmv9eZJCXc81FjxHhR7BnMx6WYNMrgOyRkcwgPGiONxHCt96YNLY1VHkQAa/IwmAH7cy0MxvT
 ZklBTGGPlX+YpscDaq06ZaS0I3OgKSSTFvPCam9xrU4DURkgLlrr/SK01iJYC/Yss5Wc=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2rTf-00076w-1V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 12:25:39 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L2KH3K032533;
 Mon, 21 Oct 2024 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=92knE4jiltiV907EhRGLVYeamkXayI
 7j0BwYX0ZH1JA=; b=WL4D7lJNas37Nzdhxi9rX+lx/0u/7ytK48q3TqjJR++gKt
 r7ueMht7alDtgQ7pasPryEpqoYRd0OWJqyszZwZ+SpNOF2LJ1isSitDYhyMC/LAS
 FwERDIOSqxtV94TGFg/XwPocGXOJNG9slT3/uBhOpxWpILgE6aPOyXK2xUh7rTpF
 iZSfIsmznUv35ep6vlQ2EA5avKOIqsYrhOQyes8ee48qcQRT99bJpKxarFGhHfc/
 Sf1AmAC4Lua0AKvgB9CPRIHyiQxUS0kOC4/Q4iiF3ywr7qQlDkQN+CyvM61jpuW4
 hTkpnbK13JKGJKjwKEuAWROXZpMXdSctg6J3mWmA==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42c5hm8my5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 10:40:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9CWB9018605;
 Mon, 21 Oct 2024 10:40:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42csaj5kvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 10:40:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 49LAe94P24249044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Oct 2024 10:40:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 389B320043;
 Mon, 21 Oct 2024 10:40:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F0602004B;
 Mon, 21 Oct 2024 10:40:08 +0000 (GMT)
Received: from osiris (unknown [9.171.37.192])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 21 Oct 2024 10:40:08 +0000 (GMT)
Date: Mon, 21 Oct 2024 12:40:07 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20241021104007.6950-E-hca@linux.ibm.com>
References: <20241021002935.325878-1-ebiggers@kernel.org>
 <20241021002935.325878-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021002935.325878-8-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f0A5vIL1iLbWasgVAUuToCuIbQMCR4iX
X-Proofpoint-GUID: f0A5vIL1iLbWasgVAUuToCuIbQMCR4iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=730 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210076
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Oct 20, 2024 at 05:29:27PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Move the s390 CRC32 assembly
 code into the lib directory and wire it up > to the library in [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [148.163.156.1 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [148.163.156.1 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t2rTf-00076w-1V
Subject: Re: [f2fs-dev] [PATCH 07/15] s390/crc32: expose CRC32 functions
 through lib
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
From: Heiko Carstens via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Hendrik Brueckner <brueckner@linux.ibm.com>, linux-mips@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Oct 20, 2024 at 05:29:27PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Move the s390 CRC32 assembly code into the lib directory and wire it up
> to the library interface.  This allows it to be used without going
> through the crypto API.  It remains usable via the crypto API too via
> the shash algorithms that use the library interface.  Thus all the
> arch-specific "shash" code becomes unnecessary and is removed.
> 
> Note: to see the diff from arch/s390/crypto/crc32-vx.c to
> arch/s390/lib/crc32-glue.c, view this commit with 'git show -M10'.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/Kconfig                      |   1 +
>  arch/s390/configs/debug_defconfig      |   1 -
>  arch/s390/configs/defconfig            |   1 -
>  arch/s390/crypto/Kconfig               |  12 -
>  arch/s390/crypto/Makefile              |   2 -
>  arch/s390/crypto/crc32-vx.c            | 306 -------------------------
>  arch/s390/lib/Makefile                 |   3 +
>  arch/s390/lib/crc32-glue.c             |  82 +++++++
>  arch/s390/{crypto => lib}/crc32-vx.h   |   0
>  arch/s390/{crypto => lib}/crc32be-vx.c |   0
>  arch/s390/{crypto => lib}/crc32le-vx.c |   0
>  11 files changed, 86 insertions(+), 322 deletions(-)
>  delete mode 100644 arch/s390/crypto/crc32-vx.c
>  create mode 100644 arch/s390/lib/crc32-glue.c
>  rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
>  rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
>  rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)

...

> -static int __init crc_vx_mod_init(void)
> -{
> -	return crypto_register_shashes(crc32_vx_algs,
> -				       ARRAY_SIZE(crc32_vx_algs));
> -}
> -
> -static void __exit crc_vx_mod_exit(void)
> -{
> -	crypto_unregister_shashes(crc32_vx_algs, ARRAY_SIZE(crc32_vx_algs));
> -}
> -
> -module_cpu_feature_match(S390_CPU_FEATURE_VXRS, crc_vx_mod_init);

What makes sure that all of the code is available automatically if the
CPU supports the instructions like before? I can see that all CRC32
related config options support also module build options.

Before this patch, this module and hence the fast crc32 variants were
loaded automatically when required CPU features were present.
Right now I don't how this is happening with this series.

> -MODULE_ALIAS_CRYPTO("crc32");
> -MODULE_ALIAS_CRYPTO("crc32-vx");
> -MODULE_ALIAS_CRYPTO("crc32c");
> -MODULE_ALIAS_CRYPTO("crc32c-vx");

...

> +static int __init crc32_s390_init(void)
> +{
> +	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
> +		static_branch_enable(&have_vxrs);
> +	return 0;
> +}
> +arch_initcall(crc32_s390_init);

I guess this should be changed to:

module_cpu_feature_match(S390_CPU_FEATURE_VXRS, ...);

Which would make at least the library functions available if cpu
features are present. But this looks only like a partial solution of
the above described problem.

But maybe I'm missing something.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
