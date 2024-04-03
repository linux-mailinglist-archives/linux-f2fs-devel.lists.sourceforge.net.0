Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F7897392
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 17:11:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs2Go-0002Ma-F7;
	Wed, 03 Apr 2024 15:11:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rs2Gn-0002MU-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 15:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=scUQD59e7U2xyc+7r9+0hqnyMCIJQpvb8El2MXxoW7o=; b=nCz4smPxvgqALJAErxMVU7j3g3
 02tOBhvz/+5fugnPWRyWJn+Ciedc0pE1d+oATdjRHVqyMd/WWqnsGFf6EEH8addQoyYrihR26QDgs
 IADAMQR8ApdgflxC5VLrgFw3vN5B4msjKDH8n7KRLocbgQ6RflyWUaeZqlDGAkomWog4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=scUQD59e7U2xyc+7r9+0hqnyMCIJQpvb8El2MXxoW7o=; b=Z0JDZjUX8UI2ofn42peXSYa1FA
 lEN+g1E4dynSXvkQCv46MVtyY8FFFwLoF4OsfrjJPcwQc9SXuo6vvW0LyMh+YYGKCUTmwMDh02NL7
 k+nxdJfIqSgnq73SdZtiVLK+3VFQUK4/KeasmgjG84fs+lAtQ//X7BsvW3iLOAXxWrmw=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rs2Gl-0007aO-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 15:11:21 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 9E9A98068F;
 Wed,  3 Apr 2024 11:11:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712157074; bh=Odp4+WIqG+c5wEGAPagzT5gQT9nbqeYbXQ72Yo9uYoU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Teetk3dJDqxv6IZpDiiE1yqMyVo5lpVBmpgKIoGsMvJlhe8wzCtov+FNZhHMh+u0n
 C/T7oYMSweYLdhjMkxpI6SH5+rA2lve24BIZK0OhqRuRHxjfIvhNWBDTPznhBLdSzL
 fc0Pdt0ULyDDbIMhpRN1H8L96QO+2HsyNsInfp/Pa5rIHZkOmjDSiW5LoEO/kyVYQ/
 H7wKdTnealHMtxs/uFpdatUzptr69ZSg1HxBKob5KrqVXE6plX3QCQ7bfA03wD1u5V
 FjDjF6goAehukPPNrJKmem+Xbg74zfrABmSH2VfH/I7WhoioqV3Xn2EhaWzKg7uaz5
 KXmaIVLa4y0ew==
Message-ID: <2896ee5a-b381-45eb-abc0-54e914605e46@dorminy.me>
Date: Wed, 3 Apr 2024 11:11:10 -0400
MIME-Version: 1.0
Content-Language: en-US
To: Gao Xiang <hsiangkao@linux.alibaba.com>, Jonathan Corbet
 <corbet@lwn.net>, Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kernel-team@meta.com
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <dce83785-af96-4ff8-9552-56d73b5daf98@linux.alibaba.com>
In-Reply-To: <dce83785-af96-4ff8-9552-56d73b5daf98@linux.alibaba.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > I'm not sure why here iomap was excluded technically or
 I'm missing some > previous comments? > > > Could you also make iomap support
 new FIEMAP physical extent information? > since compressed ERO [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
X-Headers-End: 1rs2Gl-0007aO-Mi
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


> 
> I'm not sure why here iomap was excluded technically or I'm missing some
> previous comments?
> 
> 
> Could you also make iomap support new FIEMAP physical extent information?
> since compressed EROFS uses iomap FIEMAP interface to report compressed
> extents ("z_erofs_iomap_report_ops") but there is no way to return
> correct compressed lengths, that is unexpected.
> 

I'll add iomap support in v4, I'd skipped it since I was worried it'd be 
an expansive additional part not necessary initially. Thank you for 
noting it!

Sweet Tea


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
