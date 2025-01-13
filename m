Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC8A0B836
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2025 14:34:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXKa6-0000My-Ji;
	Mon, 13 Jan 2025 13:34:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tXKa4-0000Mi-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1mjFFLO/dEDV8p/kl4I8PHcO3v1kCMiHpOgIPP3o08=; b=ZSqVCb5wvuZPyOhgZYZ8ltPZVy
 m5Sunodl0CP1XN+gT+791ZRFxSvb/uTyB+8dVAPiYPOmJviMTX0Ne7pRmIj/YLORUtuPBEVG9csti
 Zn7lw7raw4UCNyECKeDdC/36aeUiSMJGlGD5a6ABf+Ojf4DeVgEePbMZVRn/BP8YgWG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1mjFFLO/dEDV8p/kl4I8PHcO3v1kCMiHpOgIPP3o08=; b=iVAtKR3mxPaspkSIJEwVrSS+y9
 zLrWbjZ6bMctd8ZvREzpcGtnJPFKZxr3TyJ74Kk9oBsiVlNYZi722w5UoOMAIliqgvuUyXYAEEBnc
 5bhLhRI/Fkit0d52ICDd8NCubST7cs2RH+sFTjiGypICBTCQBs3sKuCSgIYQOAydQSFk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXKa3-0005sA-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10225A40F93;
 Mon, 13 Jan 2025 13:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA27FC4CEDD;
 Mon, 13 Jan 2025 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736775240;
 bh=RCrniadzlziCEycHEImc/BaSLz0tmJ4dgkmMIuYxAwM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=R8Uauld5OzJv3X1iWcRs235SrGYNPiE8dzm0Oe9kibKXUNATRxEXkSF+MuVCOvH9w
 pkO14WwSFE+Mc8Efy+2Eh0tcP9W0kNQapMdcm3qggKos+jhc77JHmP64nC8UxKTbgc
 cRAhCNRcEBtGOpaXDtyseWwMpiHCg7rYQvuwmfltsCPhEFuvQ8l/IFaTfo3pWcDENF
 yyHZQ+Q8hKnR6sOlBw1LBW/OBJojkJ0Iaz+08f4Y7lxyB7btgZByRjCkyyZR/Xdw3W
 hrFDPG+m+VDBm84KSQAxD70Jh2/ztmpZvaHcL7E7iXueAotLt8DjqlSQeLodYXqvpO
 /3OBNd/RDKWrg==
Message-ID: <bcf7401a-d934-45c1-a1c1-d92039665c6d@kernel.org>
Date: Mon, 13 Jan 2025 21:33:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: YangYang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org
References: <20250113030518.3639169-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250113030518.3639169-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/1/13 11:05,
 YangYang Zang wrote: > From: zangyangyang1
 <zangyangyang1@xiaomi.com> > > When f2fs_write_single_data_page fails,
 f2fs_write_cache_pages
 > will use the last 'submitted' value incor [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXKa3-0005sA-W1
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix using wrong 'submitted' value
 in f2fs_write_cache_pages
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
Cc: zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/1/13 11:05, YangYang Zang wrote:
> From: zangyangyang1 <zangyangyang1@xiaomi.com>
> 
> When f2fs_write_single_data_page fails, f2fs_write_cache_pages
> will use the last 'submitted' value incorrectly, which will cause
> 'nwritten' and 'wbc->nr_to_write' calculation errors
> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
