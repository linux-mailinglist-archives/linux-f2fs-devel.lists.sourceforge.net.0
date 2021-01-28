Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031A306AF2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 03:17:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4wsG-00072v-6c; Thu, 28 Jan 2021 02:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l4wsF-00072p-GU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j+dpoe65NzfU23i7qgPFny1MW4ZccU91/4l1+amtr+o=; b=FZDskAodULb1NNQfZkVUB6FKMR
 EGLTRC4ZxdbVFELE4BnLZo+aV/uejXCe8eKSBnQswUyRxjuv0V6eRZFzo6modULll0XXaSBigv4tZ
 iNjDR1zySw3lrhZ+Go2tJVGAAbj2M5tgHPZ2EQB1gp9NbizGarHDYhd8uj00CRNOIgE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j+dpoe65NzfU23i7qgPFny1MW4ZccU91/4l1+amtr+o=; b=dY5gW/Mqk5JbyS3oevCqR3aze7
 RThLC39E84NS64unwX2iPSgy/Xim26SX1oZKMUadzbXiVPxlPMZf+lgqRQxP9Rvp4kGDm4mATkrpz
 sVbm7PW9M2bFda+dA/ZJNyBVx6fpiTpMaCqHQId/jDdkWlQZGtZjR7k/sX6blicQYRvo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4ws0-00Ck5S-VT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:17:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 286BC64D9F;
 Thu, 28 Jan 2021 02:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611800226;
 bh=kkx2gxqL3eTEODYMMPfss/+rMKGv9VbYrVIUTu2Ff4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cssw+EuDfiMMpcWBMW8S00pxx9lnqxS1W91b97rL7PG0rmKgJPZ5xqF6wb/gtp2yZ
 GopReLJwPmf4Gnw6cSI59/I4BiHzQzOtVuXYJW2jboMdRI1BcosIqfsopkBhi9bKL2
 Kp5zj2rgof2d620b1orH0QxaQ6iJO91DSkqZDfrc/AX68wLvUyw7HWTU9wD2W4evcT
 hmxedXHJF7yQ1O8g0ngBrivco2m6rGJhN9FY8RIgb1HApK5YmtXYmN/LYxH/9nXek5
 hl2Z5vb+kxKcIdlaG9skNoOL7ACiBqHgK73pw7VZdlMxaaEz0dPjAz04TY5gHE88+v
 7Gm4drqXaqNyA==
Date: Wed, 27 Jan 2021 18:17:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YBIeoGowXVrG3QfU@sol.localdomain>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-5-ebiggers@kernel.org>
 <YBIPD53iVg1US++r@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBIPD53iVg1US++r@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4ws0-00Ck5S-VT
Subject: Re: [f2fs-dev] [PATCH 4/6] fs-verity: support reading Merkle tree
 with ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 27, 2021 at 05:10:39PM -0800, Jaegeuk Kim wrote:
> 
> Minor thought:
> How about invalidating or truncating merkel tree pages?
> 
> Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 

Removing them from the page cache after the read, you mean?  I'm not sure we can
assume that users of this ioctl would want the pages to *not* be cached, any
more than we could assume that for any regular read().  I think we should just
leave the pages cached (like a regular read) and not do anything special.  Like
other pagecache pages, the kernel will evict the Merkle tree pages eventually if
they aren't being accessed anymore and memory needs to be reclaimed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
