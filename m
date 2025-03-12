Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC960A5D4C2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:34:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCr0-0008Ub-Qq;
	Wed, 12 Mar 2025 03:33:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCqz-0008UU-QA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qx5AunRjuMtnzlCkQkcvP7/F7j8kwnEesd0h/GbmSio=; b=jVfPbdgXalT/clkgcgXuJDO1y4
 AHpIBgQCvemzabZ4Qb0iegMAB5MUaIpfRm8VPc7i23LZ48yOGjyLQNyJ84HXTUcPLUGbiggWdeqmM
 sJptZ32Bn3VblH+y2eJoCQoK7bsToRpq90ES0QuJLCiSbt51GtjKslGvLzaMwtrAvYME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qx5AunRjuMtnzlCkQkcvP7/F7j8kwnEesd0h/GbmSio=; b=PvjEA2vegHtxqU7MUD39DUXAZ3
 S6Bqu2OXs2/3YLriJWMJJxp7g/Qo999ZJhNfMgxqUAR+pveBotKxP0aa9CqsB/79+vFz4pMadeE8k
 4DrRDpHobe7QlWOBQzTtgyHvz+NbkrM7B5f6IoAMFWgcmXTWaJl+CBsUN60WxgFslK2w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCqz-00082b-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:33:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBD315C0760;
 Wed, 12 Mar 2025 03:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D01C4CEE3;
 Wed, 12 Mar 2025 03:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741750427;
 bh=72C6YoU9kyCXOt3c5jNmkWG6bHN23Mi14Kfu2eTsdnY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hXf+pCz8mG3Oc57KPGFpNxMVPD9QzNPfSSzjtyb09w5XKIFnK6+eKMx0XmmQoQbKj
 FiG3ehgQ4YV+zepqlCLyyL/ApbfVNkyMqD8NO46UZNw24oWlz2wNcy3G+Oak1+U6aC
 dM+IwtHy0pM0Ih2CkRNebCzSr0pW8exPlZ3dfljg+suxhwMJ087l6b9wIR95KrKKaC
 9b1jv+HZ4bnxuwZsFg0LQCfmimKKesQEKV46oBIOSV+R+gjWpXhsEF0zLSUL+RTSoh
 jB5spn56oREzFnrda8ibj7ZJtpJfZ+9LbXC0olaPsK/4DsKgJWlYsiJV0uGuafDUOP
 CCA9SGeVh7jag==
Message-ID: <6f584c4e-30bb-48ec-8273-14b6bc891d28@kernel.org>
Date: Wed, 12 Mar 2025 11:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-9-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-9-sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12, Eric Sandeen wrote: > With the new mount
 api we will not have the superblock available during > option parsing. Prepare
 for this by passing *sbi rather than *sb. > > For now, we are p [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCqz-00082b-Vo
Subject: Re: [f2fs-dev] [PATCH 8/9] f2fs: pass sbi rather than sb to quota
 qf_name helpers
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> With the new mount api we will not have the superblock available during
> option parsing. Prepare for this by passing *sbi rather than *sb.
> 
> For now, we are parsing after fill_super has been done, so sbi->sb will
> exist. Under the new mount API this will require more care, but do the
> simple change for now.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
