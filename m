Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D3623E45
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 10:08:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot3Xt-0004uF-GC;
	Thu, 10 Nov 2022 09:08:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1ot3XM-0004sO-QD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 09:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Subject:Cc:To:From:Date:References:
 In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3x34a1H/C1mLXlkkNwiCjUxEoL7S4kayB67+oVUgAE=; b=Pt/vW5Gkf+cqtrGBGSNfehg7m6
 NfBOmdF14mRZM98dvxMgZm88tshx51vk0r26TsOz8ioCzBxvvLD3vGpXGBNnvTmjunw/30oLUXSti
 XCnvHDWf9l3Dt9PiVoq+beWSgvbIg+DYQh7NNQRNB/eAESBF7QV7IGbSWd5VgbQ6klN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:
 Mime-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T3x34a1H/C1mLXlkkNwiCjUxEoL7S4kayB67+oVUgAE=; b=g2+2LbM4uEJsHuqm5fFt5DUVJ+
 bt8v8a3PHU2etFbN/r5nyIX2MtCEbH72YSIhKxdIdJzrFZ4iEJFLVppgSrDdZiLblhrynWCU+IIYb
 IBsu9r7+yVw9zC1Qm7HxZG8ECy5p8t5DeZQ/TP4eeCNtM9QgtaW8A/6X1dL0vS/5WaWM=;
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot3XJ-0000XO-RB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 09:07:52 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C315C32009AE;
 Thu, 10 Nov 2022 04:07:43 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 04:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1668071263; x=1668157663; bh=T3x34a1H/C
 1mLXlkkNwiCjUxEoL7S4kayB67+oVUgAE=; b=Ys2eGsJq14k2wljt9UkNox4R7L
 Vh/hLFeCjBW1jANTj/8E4aXSa+bvR64Gnp/nNtqjEARjVC+ML2G9XMApmws6LOGt
 ISxq4igoH7fv+AwUEkKHeO+h6lyUoBWdPtbOm1mAaAvgGZHpxMwVtvtcGS227a0F
 5CGb7yAcOGaLVAdsA2M9mv031RaP0WjDNDrUjc5vJvDUaSfJYn2j0Z7WPHld/K16
 fGUXT0De82eQC5YowgLFoVwm8MBKVIjJfobjrjDdYOrSQ88dFGnLKE1BkSxLvrpv
 Lp/vmn3Gw3WGXVWs7nSKkIfZ6quMBNOponRNp8R6cMnDSyGexuGjjk+Jf81g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668071263; x=1668157663; bh=T3x34a1H/C1mLXlkkNwiCjUxEoL7
 S4kayB67+oVUgAE=; b=bGrSX443f0T4seUQJakO4BaPI/we3l0LuzzAmNSbLCOb
 V9ZdAxnfSnPbXahKRm2hDADXR36IK4+59tbcXLXAAl7tMYcrJnBRHsU6oU6+MExT
 2/mgo4hbMg2u87WYZ2Nw+bqw4+zchPEgLxrFVNjf2WLSGXxRcZ2EdyfLMdxFtPgw
 grKfPGlZwo2cV8aC9UAOqgrTK9uV67t1p8kQBbOfH1zXXe327pBlu6Hx5TcX+orh
 tRCH6sQNDid2aQsdWZHMTU+pxNqvle8a0gK+BeuulOO72iE4xuT/qUVZMM2RSLWb
 +VmGCiA0bAwtcxUCpV4yjm0bEfEFcnevDpEgtdzWag==
X-ME-Sender: <xms:Xr9sYwkHVshbsMbBvxcxBHbuwCqOobPYphq_ek2LDMJ4mY6wDNZCuA>
 <xme:Xr9sY_0wNSlm9v1NVCyDuGYAjnOtaNOvf9ma0CDSMGbx-mxgbk367x9T9owNez4oK
 hcWFhX_xNPH2sZS9NU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeegucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtre
 ertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgu
 sgdruggvqeenucggtffrrghtthgvrhhnpeehueeuvedtffejgefgieeikeejheduieevff
 fgvdfhveeugfeffffhfeehteefudenucffohhmrghinhepghhithdqshgtmhdrtghomhdp
 ghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Xr9sY-qBRdxe8OVkPS3xbAMwHIhiZbJ_3NuF-FMe-1iefM3CQrwTwA>
 <xmx:Xr9sY8n46zBDN_xqNdgHUq9Rv5Vb2uTyzkYH3bWO4ElcbjkXMNeuEg>
 <xmx:Xr9sY-1HjbkiWnY5p0Mvq4irENpiAWnfZcN4OBDWDBzqiQdBxuBQWw>
 <xmx:X79sY4pAZ8XPZBRLVDc7EeuyVsSssEsZ0ZwLvZDwB5K7DrNl6xPjFQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 94645B60086; Thu, 10 Nov 2022 04:07:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <88fce16b-5092-4246-8bbf-23f2c03224f3@app.fastmail.com>
In-Reply-To: <202211101659.j9z9jLHv-lkp@intel.com>
References: <1667889638-9106-1-git-send-email-zhiguo.niu@unisoc.com>
 <202211101659.j9z9jLHv-lkp@intel.com>
Date: Thu, 10 Nov 2022 10:07:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "zhiguo.niu" <zhiguo.niu@unisoc.com>, 
 jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 10, 2022, at 09:33, kernel test robot wrote: >
 Hi zhiguo.niu", > > Thank you for the patch! Perhaps something to improve:
 > > [auto build test WARNING on jaegeuk-f2fs/dev-test] > [also bui [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.25 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [64.147.123.25 listed in wl.mailspike.net]
X-Headers-End: 1ot3XJ-0000XO-RB
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix atgc bug on issue in 32bits
 platform
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
Cc: llvm@lists.linux.dev, niuzhiguo84@gmail.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 10, 2022, at 09:33, kernel test robot wrote:
> Hi zhiguo.niu",
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on jaegeuk-f2fs/dev-test]
> [also build test WARNING on linus/master v6.1-rc4 next-20221109]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    
> https://github.com/intel-lab-lkp/linux/commits/zhiguo-niu/f2fs-fix-atgc-bug-on-issue-in-32bits-platform/20221108-153745
> base:   
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git 
> dev-test
> patch link:    
> https://lore.kernel.org/r/1667889638-9106-1-git-send-email-zhiguo.niu%40unisoc.com
> patch subject: [PATCH V2] f2fs: fix atgc bug on issue in 32bits platform
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/f2fs/gc.c:22:
>>> fs/f2fs/gc.h:65:2: warning: field  within 'struct victim_entry' is less aligned than 'union victim_entry::(anonymous at fs/f2fs/gc.h:65:2)' and is usually due to 'struct victim_entry' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {

It looks like the problem is the extra unqualified __packed annotation
inside of 'struct rb_entry'. Removing that is probably better than
adding extra __packed annotation that just lead to less efficient
code.

     Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
