Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833D896946
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 10:45:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrwFC-00039C-T6;
	Wed, 03 Apr 2024 08:45:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1rrwF8-00038h-S4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 08:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ARyxKsG7GVlym8JkJymXRlceZpVJP0pu/mDsnbzovQ=; b=jegZhsvRN7zyk6tattZ/oObaRk
 KojgbdH1UFGBXV94Qn/ONiKZ5BPXF9FkZrWNkkGDD16sgBQj8PCNj2cr6vRk4Mj2yOxtbSOIAi+BR
 wDmUO7Ac2HejQyO49XT6PwDkUMdH6xNQmHAxYrsBLawaQdznnH+3Pf5Tzw7nHIkZ6J54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ARyxKsG7GVlym8JkJymXRlceZpVJP0pu/mDsnbzovQ=; b=nN8rLGpCofr2Nb1lqTmce7N//z
 E7wUeJFMtEvO+sbz+jW25lqTN2MKSjrCxvXM443SdxgbXHZ5XtlKG5WgORA6FuE3zud+8PlfXSMRa
 0Q2TBBBfBVr/8Wfrc4EeoZo+OK0ZDfXabAPCFv11ACfgWuLQEkz7os00cfnIFVjYccnI=;
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrwF7-0006d8-An for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 08:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1712133906; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=6ARyxKsG7GVlym8JkJymXRlceZpVJP0pu/mDsnbzovQ=;
 b=we/YrAAMhp/Dm/WrdDb/kEsoJf8oKIL7AgylvZdjOh39+O4w/6dgNverFNKD0lerYWp3a75P2nBKWK4TKQPRBjt2VNUz3KxN46xT9aMRRskoAlEWg4/5MYkUXj4jzyXTpS4hUFrH3m0DundJxvKMhcfyrEafjh9QqKakSkpjgpk=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0W3r6Fd3_1712132955; 
Received: from 30.97.48.165(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0W3r6Fd3_1712132955) by smtp.aliyun-inc.com;
 Wed, 03 Apr 2024 16:29:16 +0800
Message-ID: <dce83785-af96-4ff8-9552-56d73b5daf98@linux.alibaba.com>
Date: Wed, 3 Apr 2024 16:29:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Jonathan Corbet <corbet@lwn.net>, Kent Overstreet
 <kent.overstreet@linux.dev>, Brian Foster <bfoster@redhat.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kernel-team@meta.com
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 2024/4/3 15:22, Sweet Tea Dorminy wrote: > For many
 years, various btrfs users have written programs to discover > the actual
 disk space used by files, using root-only interfaces. > However, this i [...]
 Content analysis details:   (-15.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1rrwF7-0006d8-An
Subject: Re: [f2fs-dev] [PATCH v3 00/13] fiemap extension for more physical
 information
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 2024/4/3 15:22, Sweet Tea Dorminy wrote:
> For many years, various btrfs users have written programs to discover
> the actual disk space used by files, using root-only interfaces.
> However, this information is a great fit for fiemap: it is inherently
> tied to extent information, all filesystems can use it, and the
> capabilities required for FIEMAP make sense for this additional
> information also.
> 
> Hence, this patchset adds various additional information to fiemap,
> and extends filesystems (but not iomap) to return it.  This uses some of
> the reserved padding in the fiemap extent structure, so programs unaware
> of the changes will be unaffected.

I'm not sure why here iomap was excluded technically or I'm missing some
previous comments?

> 
> This is based on next-20240403. I've tested the btrfs part of this with
> the standard btrfs testing matrix locally and manually, and done minimal
> testing of the non-btrfs parts.
> 
> I'm unsure whether btrfs should be returning the entire physical extent
> referenced by a particular logical range, or just the part of the
> physical extent referenced by that range. The v2 thread has a discussion
> of this.

Could you also make iomap support new FIEMAP physical extent information?
since compressed EROFS uses iomap FIEMAP interface to report compressed
extents ("z_erofs_iomap_report_ops") but there is no way to return
correct compressed lengths, that is unexpected.

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
