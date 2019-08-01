Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A77D444
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 06:05:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ht2LO-0000Mj-4g; Thu, 01 Aug 2019 04:05:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ht2LM-0000Mb-6K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 04:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zJG293VrjL0qlZzRWdJ37j8l/khyG838GKSe4VWZzhA=; b=KaEdGSp7qcu7ApasQJi7etATpZ
 CE62pxRBhMp72o7abX6iiU0njbM63XjQ7rEmy2zU1qr7eYSt0O7HOKfGJc1+5STEypwWgndwoMQfh
 bzCy5CFjsRBlB2LGpWKMI1pz2GV9lsXVfVQWaVQN6klxbAFtntUA0kIed2SEPntwjz3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zJG293VrjL0qlZzRWdJ37j8l/khyG838GKSe4VWZzhA=; b=dFnmvVj7gkHLdxIGg5CovvTRGD
 acLRK8QRPKGssSDuYoRsA/e6GFwjQFLt7314CJw0k8Nr9zU1UpMfhufqKnx4JD5xi0MC/C1OgUToc
 nKE3+JJXGbzD9vwcHjevcuRssfqTiHHf6aT/FWqwfiIcBvCPEdrWH7DsXtvuwFr/ZY4o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ht2LH-004qf4-4J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 04:05:32 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F7AA206A3;
 Thu,  1 Aug 2019 04:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564632321;
 bh=p93UwHtzJnT9bTmzWi9Xj9kNuVoH+OlrITuCGkgZCU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZvE7R67i5/FJqUTpXXMJgmYnrP6zkjLyIIQ94Tw1YOk7s0QqPvmNW/1maP7qQTEm/
 vWMPM77/byfy78m7B/pqD4jpczOqeWOzwnSaKYaX6tsk4zQMH/EQLw/tBAw4Yxb5va
 SVcj+hsNBIIFdLlvxBRGSUG5zSnPzPc9A2Lo+tQo=
Date: Wed, 31 Jul 2019 21:05:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190801040520.GA84433@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
 <20190731175748.GA48637@archlinux-threadripper>
 <5d6c5da8-ad1e-26e2-0a3d-84949cd4e9aa@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d6c5da8-ad1e-26e2-0a3d-84949cd4e9aa@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: folded.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ht2LH-004qf4-4J
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/01, Chao Yu wrote:
> Hi Nathan,
> 
> Thanks for the report! :)
> 
> On 2019/8/1 1:57, Nathan Chancellor wrote:
> > Hi all,
> > 
> > <snip>
> > 
> >> diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
> >> index cc82f142f811f..99e79934f5088 100644
> >> --- a/fs/f2fs/hash.c
> >> +++ b/fs/f2fs/hash.c
> >> @@ -14,6 +14,7 @@
> >>  #include <linux/f2fs_fs.h>
> >>  #include <linux/cryptohash.h>
> >>  #include <linux/pagemap.h>
> >> +#include <linux/unicode.h>
> >>  
> >>  #include "f2fs.h"
> >>  
> >> @@ -67,7 +68,7 @@ static void str2hashbuf(const unsigned char *msg, size_t len,
> >>  		*buf++ = pad;
> >>  }
> >>  
> >> -f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
> >> +static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
> >>  				struct fscrypt_name *fname)
> >>  {
> >>  	__u32 hash;
> >> @@ -103,3 +104,35 @@ f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
> >>  	f2fs_hash = cpu_to_le32(hash & ~F2FS_HASH_COL_BIT);
> >>  	return f2fs_hash;
> >>  }
> >> +
> >> +f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
> >> +		const struct qstr *name_info, struct fscrypt_name *fname)
> >> +{
> >> +#ifdef CONFIG_UNICODE
> >> +	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
> >> +	const struct unicode_map *um = sbi->s_encoding;
> >> +	int r, dlen;
> >> +	unsigned char *buff;
> >> +	struct qstr *folded;
> >> +
> >> +	if (name_info->len && IS_CASEFOLDED(dir)) {
> >> +		buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
> >> +		if (!buff)
> >> +			return -ENOMEM;
> >> +
> >> +		dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
> >> +		if (dlen < 0) {
> >> +			kvfree(buff);
> >> +			goto opaque_seq;
> >> +		}
> >> +		folded->name = buff;
> >> +		folded->len = dlen;
> >> +		r = __f2fs_dentry_hash(folded, fname);
> >> +
> >> +		kvfree(buff);
> >> +		return r;
> >> +	}
> >> +opaque_seq:
> >> +#endif
> >> +	return __f2fs_dentry_hash(name_info, fname);
> >> +}
> > 
> > Clang now warns:
> > 
> > fs/f2fs/hash.c:128:3: warning: variable 'folded' is uninitialized when used here [-Wuninitialized]
> >                 folded->name = buff;
> >                 ^~~~~~
> > fs/f2fs/hash.c:116:21: note: initialize the variable 'folded' to silence this warning
> >         struct qstr *folded;
> >                            ^
> >                             = NULL
> > 1 warning generated.
> > 
> > I assume that it wants to be initialized with f2fs_kzalloc as well but
> > I am not familiar with this code and what it expects to do.
> > 
> > Please look into this when you get a chance!
> 
> That should be a bug, it needs to define a struct qstr type variable rather than
> a pointer there.
> 
> Jaegeuk, could you fix this in you branch?

Yeah, let me apply this.

--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -113,25 +113,27 @@ f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
        const struct unicode_map *um = sbi->s_encoding;
        int r, dlen;
        unsigned char *buff;
-       struct qstr *folded;
+       struct qstr folded;

-       if (name_info->len && IS_CASEFOLDED(dir)) {
-               buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
-               if (!buff)
-                       return -ENOMEM;
+       if (!name_info->len || !IS_CASEFOLDED(dir))
+               goto opaque_seq;

-               dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
-               if (dlen < 0) {
-                       kvfree(buff);
-                       goto opaque_seq;
-               }
-               folded->name = buff;
-               folded->len = dlen;
-               r = __f2fs_dentry_hash(folded, fname);
+       buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
+       if (!buff)
+               return -ENOMEM;

+       dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
+       if (dlen < 0) {
                kvfree(buff);
-               return r;
+               goto opaque_seq;
        }
+       folded.name = buff;
+       folded.len = dlen;
+       r = __f2fs_dentry_hash(&folded, fname);
+
+       kvfree(buff);
+       return r;
+
 opaque_seq:
 #endif
        return __f2fs_dentry_hash(name_info, fname);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
