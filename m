Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE742CB0A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 00:09:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkElU-0003Gh-Nt; Tue, 01 Dec 2020 23:08:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkElT-0003FZ-7k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 23:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pSwE3taYv/LHvk8a1sdZNTJq8hhDztSU1+v6lZM48B4=; b=FvQYXfPrWOY3DIQNk2WyroI05L
 qoeV1AWEm/zXVgVCuZTO0tRzH03BL7Eo+eiXnX8c5BIFlcBUOP1Tj1lsjcopk/Xbzqbr4APgh7Zhj
 vZ4+dOZAkRjPpqfFHXb/kAKPlygee9c6NJJA2n0201pu0E36Jo0548g/uMVhtU3A+f4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pSwE3taYv/LHvk8a1sdZNTJq8hhDztSU1+v6lZM48B4=; b=c+cTQWM9EeykNrwyrMRY5pa991
 BEUj4YQ2rg1aVgsg7ntdTR3VOePbrWpOHN0lMkdlOmWBr7MP9nnOLzU9Nizz/P+66OPfBXiQnlSsp
 UG1i25xPueX+YFUEGRDTF2ypWAN9CAo1B3Avt9bziXzxSPc8AmmmJU71eRYsbqsPAw34=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkEd8-00Epmq-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 23:00:26 +0000
Date: Tue, 1 Dec 2020 15:00:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606863608;
 bh=UfPQWdK3xBzO1ApIT0Gn7pd2KneFS4j8rVtIyl7vrbg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfiWeMWuaKPYMaaNv9SarNLRpZv08vfHzR572Es3sRYwsmPjO71SF5djmfQppon1c
 D6snuuoylEaT+4eMUrBNlzy1IIRX679LmvlxeGbnhmZknXKzg8u4+teHK7CsizAs+6
 ge14TfRlVCJUZjbOHdANYPfd3CGZTIgupPhJoVtU=
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X8bK9l/9N03++CYM@sol.localdomain>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-3-ebiggers@kernel.org>
 <9522461b-b854-76ac-29c7-160f0f078823@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9522461b-b854-76ac-29c7-160f0f078823@huawei.com>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kkEd8-00Epmq-Mo
Subject: Re: [f2fs-dev] [PATCH 2/9] f2fs: remove f2fs_dir_open()
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 26, 2020 at 03:04:55PM +0800, Chao Yu wrote:
> On 2020/11/25 8:23, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Since encrypted directories can be opened without their encryption key
> > being available, and each readdir tries to set up the key, trying to set
> 
> readdir -> readdir/lookup?

Yes, ->lookup() tries to set up the key too.  It's different because ->lookup()
doesn't require that the directory be open.  But I suppose that's another reason
why setting up the directory's key in ->open() isn't useful.

I'll add something about that.

- Eric

> 
> > up the key in ->open() too isn't really useful.
> > 
> > Just remove it so that directories don't need an ->open() method
> > anymore, and so that we eliminate a use of fscrypt_get_encryption_info()
> > (which I'd like to stop exporting to filesystems).
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
