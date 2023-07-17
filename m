Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A52877566E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 16:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLPcc-0003rh-Ti;
	Mon, 17 Jul 2023 14:54:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLPca-0003rb-EL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 14:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m52dcX/avwwnnyAzWrjPsD2hw/2VodjWPItiNKO462c=; b=lPM5DoazdwqpDVbaNZO67xFuPs
 joOLheqtFgaEos32ZVeZZNENHwGz+LUjzqeP4Z0e1mLNArqjoTlc54hMZwz+ILXJAsV/wzlr3cS7O
 7A//dtG7RSo1FK9SXgQPr448oHQqxYbTgh6DzmdnwMLp+R7wSM1LHCXMGEk0fAtghxWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:References:Cc:
 To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m52dcX/avwwnnyAzWrjPsD2hw/2VodjWPItiNKO462c=; b=WzHCwbVxQuGjT4SO6KG7L7lxm1
 S+XEninZAsl26TvOfO+4CpFHMSds9lmJ2bOJ7Q+JrHHBCYUXzm53qju96gx9aM98rGNESEwp/BeNL
 bQQXDKzBZ+fVt/YUhewFfpWh9EPJPYf+yTxYhOxsxSGS7EvjaO1g5rZno8VCygzdjiPo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLPca-00Ah5g-A2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 14:54:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCC0C61115;
 Mon, 17 Jul 2023 14:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FAEC433C7;
 Mon, 17 Jul 2023 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689605677;
 bh=m52dcX/avwwnnyAzWrjPsD2hw/2VodjWPItiNKO462c=;
 h=Date:From:To:Cc:References:Subject:In-Reply-To:From;
 b=MPSETDNZVE5Nt858pLSwjACGRuFDG7yPCWsyRdeM5x9VvikMHGRnC+i0wM3WN+nW1
 CSoMWI+Eslc0sfDnSL3uQxSNmmJ3I1gEAC+8HpbB4y4IIKuu6qgM0lv2vOAGQrx50r
 061DmE9pWhUgTEuhStUX9AH6oTYng9Lz18Vl4WGxvgf4+IFf0vQWneH9kOv8cLKLQP
 N58tngUoN0NJJ/b8H57B5ExSBB+VeP84hqA6+Q70CwkRZfvTD4zqPF/qiTQifmOj8f
 x8kTduKia2o/z55zEZOABgMVgTOCM7VIfqmNaZ8rgtqGhmpJ9KbxJ4M902uCgrNr2x
 FP84PYyaWI66Q==
Message-ID: <e31ee7f0-5db3-c8ee-d327-cee619e0286a@kernel.org>
Date: Mon, 17 Jul 2023 22:54:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Chao Yu <chao@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
References: <20230715060936.2343780-1-guoweichao@oppo.com>
 <b5d7b6b9-d328-b7c5-3d46-78d5c93f9251@kernel.org>
Content-Language: en-US
In-Reply-To: <b5d7b6b9-d328-b7c5-3d46-78d5c93f9251@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/17 9:40, Chao Yu wrote: > If I understand Eric's
 commnets correctly, if size == 0, we'd better just return in > order to avoid
 below codes which may access out-of-boundary on xattr entry. Oh, wrong comment,
 please ignore it. 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLPca-00Ah5g-A2
Subject: Re: [f2fs-dev] [PATCH v4] f2fs-tools: support to show
 fscrypt_context_v2 in print_xattr_entry
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
Cc: ebiggers@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/17 9:40, Chao Yu wrote:
> If I understand Eric's commnets correctly, if size == 0, we'd better just return in
> order to avoid below codes which may access out-of-boundary on xattr entry.

Oh, wrong comment, please ignore it.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
