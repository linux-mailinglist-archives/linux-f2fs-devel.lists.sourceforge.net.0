Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86880843262
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 02:00:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUyxx-0007OX-EH;
	Wed, 31 Jan 2024 01:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rUyxv-0007OR-J8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 01:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=od4iupYQtarrLXzPOZLp1dIy/kPksNSHjQUcmMbHrPw=; b=h7tvit5q8TIxWibGX7EVxgEHg6
 PG0+TS1qXbYt2lAwNwW+Ogfal5HtBNlCqWLL+nXNctYf3XyOJ60kWzODuFg/i5LuhsZvNjws62iGW
 J6ZXoPT5PQk2WFDwgOrpiT/e1W8DD6ZSrwvIWq13QMZaDhU+SxZMmquspBlI4ZNQDyck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=od4iupYQtarrLXzPOZLp1dIy/kPksNSHjQUcmMbHrPw=; b=JZHM1zxd2+VX9y6eEPcGYjmqb3
 gXUP/2wRubnk1TOok07RdCtyIb4wFNkGuL1fLysVkAQTMCjYCSNmwK1MFlLhQ8/Kkd25FPjr63pnX
 /J1cgvQlYoRqs6Oj/wAfviPB3k4BVVKO4MZF1D6CuhOcBEqd/N5JxMxv0nyXM/+I2dgw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUyxv-0003fF-4D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 01:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B2BC6121B;
 Wed, 31 Jan 2024 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01E7C433F1;
 Wed, 31 Jan 2024 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706662825;
 bh=ez1CGgenjsF/Is63/eP+yB/neTNt6mvPpFdWEtgf8HA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDcMV56LD9h33+lHXOcKL7fIZDvxwA7ZR8UVDBC72qFrvjNCeo9nWdHbKO2Wr0P2+
 VUW2ei7W0/0Dxl6kGIC++iqr+CkZzAAV/7XJJ1C/gdIwemOf09VmwlSnPxcQUJXp9b
 ZqQqqNTUXB+nZX0L8wEnYvKHazUv8EO+HE4yOuyVHNBt2518/UkROKd7sxmYg5Isx+
 MMaohYtdfykriCEJ9w/xaeRTQOgApdYVr/3d7YA0ee1f/KYh2kwfhOjEuH4biZ7z82
 oSPFS+d3Cu0UFh601y1/bH7qAXxtJEj9yfo3dMEjJRg5UThDvtKZVTJtjOQNqSGek4
 Qdb/3mUUYXDBA==
Date: Tue, 30 Jan 2024 17:00:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240131010023.GE2020@sol.localdomain>
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-8-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204330.32346-8-krisman@suse.de>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 29, 2024 at 05:43:25PM -0300, Gabriel Krisman
 Bertazi wrote: > In preparation to get case-insensitive dentry operations
 from > sb->s_d_op again, use the same structure for case-insensitive [...]
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUyxv-0003fF-4D
Subject: Re: [f2fs-dev] [PATCH v5 07/12] libfs: Merge
 encrypted_ci_dentry_ops and ci_dentry_ops
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 29, 2024 at 05:43:25PM -0300, Gabriel Krisman Bertazi wrote:
> In preparation to get case-insensitive dentry operations from
> sb->s_d_op again, use the same structure for case-insensitive
> filesystems with and without fscrypt.
> 
> This means that on a casefolded filesystem without fscrypt, we end up

Again, we shouldn't use the term "case-insensitive filesystem" (or casefolded
filesystem) when we actually mean "case-insensitive capable filesystem", or more
precisely "filesystem that supports case-insensitive directories".  Real
case-insensitive filesystems like FAT are not relevant here.

> Also, since the first fscrypt_d_revalidate will call d_set_always_valid for us

This is outdated.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
