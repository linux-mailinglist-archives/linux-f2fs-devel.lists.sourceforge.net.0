Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF6145EE1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2020 23:59:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuOyH-0007Fo-9N; Wed, 22 Jan 2020 22:59:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuOyF-0007FX-F3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 22:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fH+E9Tj2h25yLjy+ynpgTyVLEpP3RchZJmc3FAnh1kc=; b=ZxA2NRL9t/orT94VzyLPgrwjLZ
 rYlI1jO+5efwBS8Iws4/A6ui6+nXieOL2ppRUXnv/o+O0Sh30Yp08EtjKK0pjlr5PS5sMCG/5aN0l
 1U6s7e1RBDfloMu6i6dJ9xpYCHpmj71G5dlnYC3EHxKjBS51jGNrzAWWWm5d9xBTul5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fH+E9Tj2h25yLjy+ynpgTyVLEpP3RchZJmc3FAnh1kc=; b=MV8ujOPGjAOjAf4La6wpHTM6Nt
 ApnqMWPVnrW076WqaOrRYtbP5WJgzVAdxAo74iI3aJC6fPz/HupM7h8OLHgL85Luvk117La6VzEyy
 xaZs4JYmF5gc0qDDbg7CJoYnJA5Ci9n1JsXAXemw5AHVsMX7j9aF42d/mRv5D1HoANvw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuOyA-00F8mg-0K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 22:59:35 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D5E221835;
 Wed, 22 Jan 2020 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579733959;
 bh=PEgc7glKU+eTUcoJvJSY2cFK4bxB8lTHfVQY/rxd9nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1/1qVGJ7dgvX7BRXVza1/cj12O3YybXAukgv+DgcaApLwrlHilg0Po8C+0NaZuKjh
 R1bg0kmBt9xA2/0vvYiPXtzqPC8DeYarFzR6h5qgSEH9/4aWbqvufBlWv9/+ty1LwW
 7pz4DFyw1ZzxD4MZh5XqQMX62UN3Nhccj2yWOsuE=
Date: Wed, 22 Jan 2020 14:59:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200122225917.GA182745@gmail.com>
References: <20200120060732.390362-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120060732.390362-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuOyA-00F8mg-0K
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't print name of busy file when
 removing key
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jan 19, 2020 at 10:07:32PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When an encryption key can't be fully removed due to file(s) protected
> by it still being in-use, we shouldn't really print the path to one of
> these files to the kernel log, since parts of this path are likely to be
> encrypted on-disk, and (depending on how the system is set up) the
> confidentiality of this path might be lost by printing it to the log.
> 
> This is a trade-off: a single file path often doesn't matter at all,
> especially if it's a directory; the kernel log might still be protected
> in some way; and I had originally hoped that any "inode(s) still busy"
> bugs (which are security weaknesses in their own right) would be quickly
> fixed and that to do so it would be super helpful to always know the
> file path and not have to run 'find dir -inum $inum' after the fact.
> 
> But in practice, these bugs can be hard to fix (e.g. due to asynchronous
> process killing that is difficult to eliminate, for performance
> reasons), and also not tied to specific files, so knowing a file path
> doesn't necessarily help.
> 
> So to be safe, for now let's just show the inode number, not the path.
> If someone really wants to know a path they can use 'find -inum'.
> 
> Fixes: b1c0ec3599f4 ("fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to fscrypt.git#master for 5.6.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
