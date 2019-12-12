Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BB11D4FA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2019 19:13:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ifSxr-00057c-NS; Thu, 12 Dec 2019 18:13:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ifSxo-00057T-9S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Dec 2019 18:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G49Rl0ofxGDjV0ebu1h/WHiySZFXkCT6JdTKwgc+3Ho=; b=MXTpODna5yKdKd0r5C0nLcShy6
 o5opsbeDz1WoZlV5Tq6cUP9pi8Gf6s8crY8SMf7WLzGfPrJNUmnp4BW0SwgxL8/wwcshmsGWxouvW
 r+UWORXg9Jz0A8y58ChodOryh3N9kUQVekyRj5KlXRr9pR4hrr0C7JoIISXCOzPaV6ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G49Rl0ofxGDjV0ebu1h/WHiySZFXkCT6JdTKwgc+3Ho=; b=SIiayh9cdmASlzvjhGIk17EHpU
 yoPo73ZnX682AlPk9e9WOHHqlMe16M6HKsIWSRKV+iYg3O4EA34N0pINuqZwNuBtegdPjlTqa7O12
 gqgA45Yb1kv6mwKXhp+3nSJ/woKNsll3+rGyBaAPXX2PoDV4xJPq6ULEve5MgmPkhPTE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ifSxm-00CenL-M0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Dec 2019 18:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G49Rl0ofxGDjV0ebu1h/WHiySZFXkCT6JdTKwgc+3Ho=; b=LEKz4gfOoesGVprlJRemg+jlu
 y3BHsx4zmfnfmGq4f4UDn2GYw3qZGWH1JLLTPtwCy/D5xPR7U3a4MKAnGCfWv3IS+ubNJyrqnIbqt
 tTGPNK+AK0F8W7QxE7aNPMK6bWPFA2WulJJeoH5Br2wUJJE3442kCY4BTUKRM18l9QziV8MQjbgDN
 LRaZ046/THnA0MnX7NKNXa4TrGTJvWFN+Vc89RUb5J5EBJENodCWnRHzP5+rVDhtas/y6Vlbi8xyB
 X608T2PTboYMdcL3cLbijTp+075vI7BlqU/6h/RwSYjZGbLLf4vdklpfZCaCsdLjIA/VQE8WaeUzt
 g3nIla6iw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ifSxS-0006Ii-Ow; Thu, 12 Dec 2019 18:13:02 +0000
Date: Thu, 12 Dec 2019 10:13:02 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191212181302.GT32169@bombadil.infradead.org>
References: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
 <20191210191912.GA99557@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210191912.GA99557@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ifSxm-00CenL-M0
Subject: Re: [f2fs-dev] [PATCH v4] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 10, 2019 at 11:19:13AM -0800, Eric Biggers wrote:
> > +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> > +{
> > +	if (unlikely(name[0] == '.')) {
> > +		if (len < 2 || (len == 2 && name[1] == '.'))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> This doesn't handle the len=0 case.  Did you check that none of the users pass
> in zero-length names?  It looks like fscrypt_fname_disk_to_usr() can, if the
> directory entry on-disk has a zero-length name.  Currently it will return
> -EUCLEAN in that case, but with this patch it may think it's the name ".".

Trying to wrench this back on track ...

fscrypt_fname_disk_to_usr is called by:

fscrypt_get_symlink():
       if (cstr.len == 0)
                return ERR_PTR(-EUCLEAN);
ext4_readdir():
	Does not currently check de->name_len.  I believe this check should
	be added to __ext4_check_dir_entry() because a zero-length directory
	entry can affect both encrypted and non-encrypted directory entries.
dx_show_leaf():
	Same as ext4_readdir().  Should probably call ext4_check_dir_entry()?
htree_dirblock_to_tree():
	Would be covered by a fix to ext4_check_dir_entry().
f2fs_fill_dentries():
	if (de->name_len == 0) {
		...
ubifs_readdir():
	Does not currently check de->name_len.  Also affects non-encrypted
	directory entries.

So of the six callers, two of them already check the dirent length for
being zero, and four of them ought to anyway, but don't.  I think they
should be fixed, but clearly we don't historically check for this kind
of data corruption (strangely), so I don't think that's a reason to hold
up this patch until the individual filesystems are fixed.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
