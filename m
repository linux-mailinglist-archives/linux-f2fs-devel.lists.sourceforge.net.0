Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB761E1152
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2020 17:11:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdEks-0005eh-VS; Mon, 25 May 2020 15:11:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jdEks-0005eW-CS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L5kEY8PwPG6XNzlvi7Ph5gIxunvHIv7Jg5HIdAX/lKE=; b=Ogrzv5c0iduIhzxzBPdJnfZOdJ
 rhG1dYfPB76VT4k8lEpHrJJYu8VD0RSn8CbE/bk5Tj1U7Tt+vY57TmXLH8dSSkbTWgFsUR9LDW40L
 m6GTpaomVGLwll2jIToNoNVX9G+TexV6wWf3TbAqoeo1DQcXrteKYFmHp+xnM+ezO8dM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L5kEY8PwPG6XNzlvi7Ph5gIxunvHIv7Jg5HIdAX/lKE=; b=QKzevL6WdNqwdXz1Af7aQKDQDX
 GO+Bd2Xp1oScCrDc+WEJtsmpN59zy8c0hL0/bt+FF/V5ug9YT2XGc4OtpQ4ao6dnl9MKNxn6olMTk
 GRtOZaCSFzBAcp757B4u04rugaNNYNdHAXMHrIkU9hWkNSw+eHPTk8+h0aXNGe+65BHc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdEkp-00EuXr-73
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:11:06 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBF552073B;
 Mon, 25 May 2020 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590419457;
 bh=kWDchJjRAEJVbNKSENl4Ienf/7DpzmUVEB1I8GSDrEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fpCzqg8Tp9ZS4H8j9ZJ4ccZdUup73PHLuYGsjSAm4AUzRDJ5CyxKsrCnhsLNShcme
 jqzUNZEUdhHw3s5Zl2/m1xK4+nyFHwrEDSsdJOC9bb1E2W55jF1nxTUhuj/rJXhZKF
 iCSCqKIKFFwEcZbPkJAFH54VOxZUQAeYk8NY2vqE=
Date: Mon, 25 May 2020 08:10:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200525151057.GB55033@google.com>
References: <20200507075905.953777-1-ebiggers@kernel.org>
 <20200507075905.953777-4-ebiggers@kernel.org>
 <9c18ded1-06cb-1187-1eac-5ba354eebee1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c18ded1-06cb-1187-1eac-5ba354eebee1@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jdEkp-00EuXr-73
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: rework filename handling
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/25, Chao Yu wrote:
> On 2020/5/7 15:59, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Rework f2fs's handling of filenames to use a new 'struct f2fs_filename'.
> > Similar to 'struct ext4_filename', this stores the usr_fname, disk_name,
> > dirhash, crypto_buf, and casefolded name.  Some of these names can be
> > NULL in some cases.  'struct f2fs_filename' differs from
> > 'struct fscrypt_name' mainly in that the casefolded name is included.
> > 
> > For user-initiated directory operations like lookup() and create(),
> > initialize the f2fs_filename by translating the corresponding
> > fscrypt_name, then computing the dirhash and casefolded name if needed.
> > 
> > This makes the dirhash and casefolded name be cached for each syscall,
> > so we don't have to recompute them repeatedly.  (Previously, f2fs
> > computed the dirhash once per directory level, and the casefolded name
> > once per directory block.)  This improves performance.
> > 
> > This rework also makes it much easier to correctly handle all
> > combinations of normal, encrypted, casefolded, and encrypted+casefolded
> > directories.  (The fourth isn't supported yet but is being worked on.)
> > 
> > The only other cases where an f2fs_filename gets initialized are for two
> > filesystem-internal operations: (1) when converting an inline directory
> > to a regular one, we grab the needed disk_name and hash from an existing
> > f2fs_dir_entry; and (2) when roll-forward recovering a new dentry, we
> > grab the needed disk_name from f2fs_inode::i_name and compute the hash.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks, but it's quite late to rebase stacked patches for this update when
considering we have only 1 week for pull request. :)

> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
