Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D228A29E9B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 03:11:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfrMf-0006kg-Bg;
	Thu, 06 Feb 2025 02:11:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tfrMe-0006kW-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 02:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bLoMVe3+dO6AR4HDcJiaDeWpQ5lb/RVurvV859TFLAs=; b=YBiHP9dg0XuADrFHfc+Onndc9H
 TUC+IPk+Q3zXBUoPEU31JwufwRd51epssLIWLfgfpoS3qrERkOpQB6pd77YIPQ8ZV4JC3Z69IBCEv
 G21rW/V1ePinjkS7mhjwg4RPT/ZxrYRyq8MguevTvTSsVquEBXWeJz2fwtWwdxNYy1jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bLoMVe3+dO6AR4HDcJiaDeWpQ5lb/RVurvV859TFLAs=; b=PDDLZ8GIJLm4DOzcTEozmwNODX
 pRQ96jhqb9dnrlLowhhkYqmu/xg2Gvf4y8kVkJeddVyFoZ9T2td5/HwKqfivWvlRY955udIK8aRN+
 x0XCJjWOzbJlnpPA1vTM/WgVxM/lDRfJrIqf72QAwAL4PJEibwKO/WiyWHGBO0Tnx3+4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfrMd-0000b6-EX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 02:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BEC5BA43C74
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Feb 2025 02:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892CEC4CED1;
 Thu,  6 Feb 2025 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738807889;
 bh=qR4aqXrsloPMkB41nqvr7YJ5vWbSvPdLHVAfUjj5CBQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CQE/vEYVUdXDSPhB7MYwZHCdBgPgVMb1lrztPyo06HkeYOK/w73j4arDexT8COYH2
 A8w5ZNZRjo9UT7ytejX90t2VmQe7B1JpiHDnNcnzZFFV2qLTLmUl9lWpZ+vBBERik+
 UN9ob3TuoKkoBDyl8KZ/AURXLvOfVDomrmiZLHSAQLrkDmc4Es/zXayH5vf6wn9AWd
 sxD4IzmCzzf+QKtwlgL1JddZyaAq9T/7zvafe86eufRMCpqMG2FgbBF5QPG978NBk9
 /e1RV/v2r4UKxk9vrzzMWqQ5W3H94FnbyG5BJAUfpBdtu/tGHrePdEQifuZJ2S6EoA
 Eeu+csFjfJgtg==
Message-ID: <74e94276-aaa1-4b82-8a5b-74d767cf63a2@kernel.org>
Date: Thu, 6 Feb 2025 10:11:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
 <20250131222457.1634039-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250131222457.1634039-2-jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/1/25 06:24, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
 > the pointer. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tfrMd-0000b6-EX
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce f2fs_base_attr for
 global sysfs entries
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/1/25 06:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
> In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
> the pointer.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
