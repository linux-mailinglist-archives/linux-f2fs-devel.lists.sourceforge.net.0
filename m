Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 418567F9740
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 02:43:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7QeW-00018R-VE;
	Mon, 27 Nov 2023 01:43:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7QeU-00018K-JT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 01:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IED3zeaTzVZDcF0x/F9B5GhMe/nAEmFTEpukgWwleKo=; b=a/3ARFFStkJ9FRzxucj3gwdMpp
 vXCUUQSRLSBI7k/Dr7kvUGlK0H4I6+73ChGH1HjPfjPHyuRkZ6CUGL4plHc+M1367pcDw3XQad2EY
 rGKlGrkO1YSPdeodWH9V2Yiicudkx0maA6AOHz1b6LeptlvB/tIqoRBRNzG6n7fK2ol4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IED3zeaTzVZDcF0x/F9B5GhMe/nAEmFTEpukgWwleKo=; b=mXOs8STsmcSWMpQaXU2pXG/0ie
 Qc6tO2Yapr35uJ1WGnogr4wCvzgqmWbtEap57xIDVI0HnkwAkVkJVbVzGnk1XB26riSMw2mmLR0MS
 q5/pdTakRQ83eiMMOZKHNb5Z22H4nuD2lCLWfaNqswAtiVPgSqPdkgORUNxh+0QW2oj0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7QeT-00GNvc-SV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 01:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 402D7CE0202;
 Mon, 27 Nov 2023 01:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C72FC433C8;
 Mon, 27 Nov 2023 01:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701049375;
 bh=ctobfUrEZR4NeYWuOqtChKI0qMdBnUnMjzDcC+gkKVs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YfO0q8h/ixV9c8RcqN91uKb9X/EknA5JThu6TMxZ9nli8UjG/7IOCeheiehAr5jxe
 HIiXG3xK20zen+De/2oMeF/5xKUZchoKj3+hvcoWs7iNzgfNNFXoglxObicPKz2XQX
 0sEb4ihPiQaT7SZ++XOvEiPJUrqkorGe1kuD0TFhFmCiIioRMIULR1g1dzh2YnjqEz
 XKygPtsRu/f4KBIMgycS4RDtf4h3hruLYVFWHqGSAv00gZRz4xjYa7FPs5TfzgD+rz
 v3Skxptdxkz20rwryLBzcWwCusT80gxJg+L93J3lEbTwGmUD8AldM4V0R9nLT/yH34
 BeM2MIoz40OmA==
Message-ID: <10ad033a-42e6-b15e-ad4f-f443968c1daf@kernel.org>
Date: Mon, 27 Nov 2023 09:42:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231118020309.1894531-1-drosen@google.com>
 <20231118020309.1894531-4-drosen@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231118020309.1894531-4-drosen@google.com>
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/18 10:03, Daniel Rosenberg wrote: > The initial
 sizes for dqblk.dqb_curspace should reflect the block size, > as that's the
 minimal filesize. > > Signed-off-by: Daniel Rosenberg <drosen@goo [...] 
 Content analysis details:   (-6.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7QeT-00GNvc-SV
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs-tools: Fix dqb_curspace to reflect
 blocksize
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/18 10:03, Daniel Rosenberg wrote:
> The initial sizes for dqblk.dqb_curspace should reflect the block size,
> as that's the minimal filesize.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
