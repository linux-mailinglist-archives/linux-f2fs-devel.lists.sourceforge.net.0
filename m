Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44251E0880
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2020 10:12:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jd8Df-0001ky-Rj; Mon, 25 May 2020 08:12:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jd8De-0001kn-5c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 08:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FQkcPOZ0w00WQVTYqus6NjYLbiUyr7+moY9HPfdM2xY=; b=dHCIVsP9FLqBQgf61eCN7HygB0
 pjDX9ZvPUp9ytVJa7FTw7au1L1uOMZP9TLjRI7Lw8TyWxTs6Tc7rHlz+eAY4SS96SPY5WpJfGDgSY
 mSdbNGkpc+NtiVCSveS23az36bfK3US4m8k+9cptZMerNtt2C/9SoTdp8iIAV3b5w0I4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FQkcPOZ0w00WQVTYqus6NjYLbiUyr7+moY9HPfdM2xY=; b=ewfSXtohMtTRcfjdax50i4Jcgr
 Xe8cTEztiJ2ZFdWYayq4lZ9MQ203IO8SMrXi9egYTVjT7QqV8fzkSEiCYXe9MbdeKCJabZxRw7AyI
 g3iJr3EjAzgWXK11s1+AZYTFdPD42zFyZxjsvpFZ/6r54dtd3DypzF8TJYF19jVvNbjI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jd8Dc-00DWpd-4w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 08:12:22 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 040F41979D741AC98205;
 Mon, 25 May 2020 16:12:11 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 25 May
 2020 16:12:08 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200507075905.953777-1-ebiggers@kernel.org>
 <20200507075905.953777-4-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9c18ded1-06cb-1187-1eac-5ba354eebee1@huawei.com>
Date: Mon, 25 May 2020 16:12:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200507075905.953777-4-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jd8Dc-00DWpd-4w
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/7 15:59, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Rework f2fs's handling of filenames to use a new 'struct f2fs_filename'.
> Similar to 'struct ext4_filename', this stores the usr_fname, disk_name,
> dirhash, crypto_buf, and casefolded name.  Some of these names can be
> NULL in some cases.  'struct f2fs_filename' differs from
> 'struct fscrypt_name' mainly in that the casefolded name is included.
> 
> For user-initiated directory operations like lookup() and create(),
> initialize the f2fs_filename by translating the corresponding
> fscrypt_name, then computing the dirhash and casefolded name if needed.
> 
> This makes the dirhash and casefolded name be cached for each syscall,
> so we don't have to recompute them repeatedly.  (Previously, f2fs
> computed the dirhash once per directory level, and the casefolded name
> once per directory block.)  This improves performance.
> 
> This rework also makes it much easier to correctly handle all
> combinations of normal, encrypted, casefolded, and encrypted+casefolded
> directories.  (The fourth isn't supported yet but is being worked on.)
> 
> The only other cases where an f2fs_filename gets initialized are for two
> filesystem-internal operations: (1) when converting an inline directory
> to a regular one, we grab the needed disk_name and hash from an existing
> f2fs_dir_entry; and (2) when roll-forward recovering a new dentry, we
> grab the needed disk_name from f2fs_inode::i_name and compute the hash.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
