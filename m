Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27CC03277
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Oct 2025 21:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrG7erni0ObfJLWAe6zuYCfvln8uOGEm+ezo2x47ePI=; b=Qc+zr7h/udD4vrFX22bRrGRzbf
	anjmS/PUmN/bEba8JvoFn5iDgS2YvhiD4VrB5BWe8mKM8MP05QBYFv6pzZ1gAoTvqZccWYJd9KtD/
	7sCC17fYL0u6+zCkScvgVcCX0+JyTPVczSZ51kFwFI8iR+TUQ3BZNRMpGUE8tSIb/fKo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vC0nA-0000Go-PK;
	Thu, 23 Oct 2025 19:16:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vC0n9-0000Gh-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Oct 2025 19:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=; b=LHVmQPRauM6POyR79pjuT+c6aa
 D9bB9k+ySg0IUpsIhP9zcQLAwesRKghgXMNSCCbYje9I/Uu4zIg47U9COM8RwpsfhYfOrkawftBeR
 slzwZj6ExYf6OeK2I2qtJWfFO+dubXOBxKFV8oXgUj8XTUKGgZ4JGL8g1yEeYK5XMkbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=; b=RTzsoApZY4enBUYFf6as+BkTje
 wlyZrpTS98EHuBsr/iZf3AG+mdafAHtnctCVoy/ZglSPF4HJ6AI13XpVpfowuqRI7mnXF6+LVaAxR
 fhOArWjKkFbw8gUca7Idq+rkFJws3gZY0JIvmfblJ8sJFTjLfTMj5flJ9g+GSoSTjAgw=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vC0n8-0000v0-Db for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Oct 2025 19:16:06 +0000
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b626a4cd9d6so259255966b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Oct 2025 12:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761246955; x=1761851755; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=;
 b=HdjqGLlPnJF+OxMG/sI8kkt5NUT7lt/RX86RZhHWhYEkOYo8WjCXCBh21bW0LABrvH
 RcfEIL0wlSXNDnDwY1V/Da9gi4QZ6cM3VIq3uFFNJBHGFU7EEL9dTXMw3ZqTTVI7RRhX
 uJ1aLLVxfVkrJkm4jG6Wn9KL18hNfJPgvYNU2Ix2I3AIROl48dt5+i20oe7E/qUi0eQd
 N7SpPyPDhOwO1nxPRcnEymWujm0GRogJzNsZoVwqBsL/VK64H1WT5oRGk6ELa/0k12r/
 rpsCVKRXbIDWEhAP6RFuTUhsxbB3b04HEn/CjFTYo05/N8aE4TiCu9tgo69CsiG2PLCy
 yMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761246955; x=1761851755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=;
 b=XQeC539rjIfiOEkRhBC7CXWKef/PFVxsjRCw8Gvr80+EOyxkuKll3X0C0YkX4Pox1W
 NU5ybZB+pjO20MHdnxy2ZH1T4EZpT2GpPf6uj2uGLOSFaeoUQZh8Fvv050WlbmQ6HB50
 h3g1FRLFR7xFFott0KVs/R4iAiMf8d1XjwDmwGSei05mxN0KFdF2DonlC5xRfBfJkZpk
 ZOgQGuQbwipNCgUrq3p0aKJ7G+kfeT5Q0fuzmCeZs4NPbO9kONmhrhpUP0On2vKIjFMZ
 jBwBUgl34B3DjutyeOd1bXXEp/FMxnmtABHyGi4IlnvVL/i3+03/OfXF62PcLRamSVnE
 ozpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfKrCcEZeCriRAxVRFJsCDovo5HucCdl6QHi3xlM34heSahV8Q8+3B8D9ufOz/nVc7JpoY4+2ZiQX7YynJQHf+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzP+kNCfmGhCzW3DqYphALPHX2UnhnkZMIGoDJsuy63pHu5+Ev8
 vuZV8iTxKfqmgz1voi9wuGC5Gukfl3Wl57JQ7SUszhIM4a/LU6a62I7b
X-Gm-Gg: ASbGncszFF8YbSxBjmEtbOeGFvb7RNLfZHOaAeiai7qU0t4QEi5Ajj9DqXQwImTBCtq
 P9ivol5Jc1Ij8uOVTldvse6xf4fyAghEvFHnqb9E3UdfF4sHBBhJh4JPutkzX77QgrK3Bt4DCO4
 BBXDXFh6DaVgaAoJRnNW0TimiNqxZ1HkijXZ8YjwvRgR86qpubtyAWgpqeYU7vbsmf1/FsA2NU9
 LSLtgz776SbX9QnO9qW3YRWXRZaAmfo1PKd1te/5vNn+8TyghlwHI/n4QyNgKnW3/KnbQLgCMBj
 nn9YLtrMmB8hssnBSqzx0Rjbl76UyJL8JOZwsPDZ/3U54mGv5upn5CF5jdUdPctiVFG14+c8xKh
 PilN/ssxe5xUe+7ic5zJGDQdBNCPguzf6Kczl/iMOQ9SH0APYVURkgLadrvhxpyj4ARu+b7fP+7
 Gdw7y2GusWCTI=
X-Google-Smtp-Source: AGHT+IFQ8zsmfxbVRlBQymGZwkPQggnvEm3GLl2aAuMqOaDpv1htIdjug4OIDiv0YEb5M676Erxv0A==
X-Received: by 2002:a17:907:6e87:b0:b3c:193:820e with SMTP id
 a640c23a62f3a-b6472c619c0mr3105635166b.13.1761246954536; 
 Thu, 23 Oct 2025 12:15:54 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5147240csm285346166b.73.2025.10.23.12.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 12:15:54 -0700 (PDT)
Date: Thu, 23 Oct 2025 22:15:51 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <2pro6x6xdvfhaypqhddzlmitx2vo6h7ro5mcqcf5tc7ssvzdls@cge4oegdkf5t>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
 <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
 <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
 <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 15, 2025 at 03:55:40PM +0300, Nikola Z. Ivanov
 wrote: > On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote: > > On
 10/14/25 20:17, Nikola Z. Ivanov wrote: > > > On Mon, Oct 13, 2025 a [...]
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
X-Headers-End: 1vC0n8-0000v0-Db
Subject: Re: [f2fs-dev] [PATCH] f2fs: Perform sanity check before unlinking
 directory inode
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 khalid@kernel.org, skhan@linuxfoundation.org, jaegeuk@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 15, 2025 at 03:55:40PM +0300, Nikola Z. Ivanov wrote:
> On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote:
> > On 10/14/25 20:17, Nikola Z. Ivanov wrote:
> > > On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> > >> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> > >>> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> > >>>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> > >>>>> Current i_nlink corruption check does not take into account
> > >>>>> directory inodes which have one additional i_nlink for their "." entry.
> > >>>>>
> > >>>>> Add additional check and a common corruption path.
> > >>>>>
> > >>>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > >>>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > >>>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> > >>>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > >>>>> ---
> > >>>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> > >>>>>   1 file changed, 20 insertions(+), 8 deletions(-)
> > >>>>>
> > >>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > >>>>> index b882771e4699..68b33e8089b0 100644
> > >>>>> --- a/fs/f2fs/namei.c
> > >>>>> +++ b/fs/f2fs/namei.c
> > >>>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> > >>>>>   		goto out;
> > >>>>>   	}
> > >>>>> -	if (inode->i_nlink == 0) {
> > >>>>> +	if (unlikely(inode->i_nlink == 0)) {
> > >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > >>>>>   			  __func__, inode->i_ino);
> > >>>>> -		err = -EFSCORRUPTED;
> > >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> -		goto out_iput;
> > >>>>> +		goto corrupted;
> > >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > >>>>> +			  __func__, inode->i_ino);
> > >>>>> +		goto corrupted;
> > >>>>
> > >>>> Can we detect such corruption in sanity_check_inode() as well? So that if
> > >>>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> > >>>> flag and then triggering fsck repairment later.
> > >>>>
> > >>>> Thanks,
> > >>>>
> > >>>>>   	}
> > >>>>>   	if (IS_ENCRYPTED(dir) &&
> > >>>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> > >>>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> > >>>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> > >>>>>   	return new;
> > >>>>> +corrupted:
> > >>>>> +	err = -EFSCORRUPTED;
> > >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>>   out_iput:
> > >>>>>   	iput(inode);
> > >>>>>   out:
> > >>>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> > >>>>>   	if (unlikely(inode->i_nlink == 0)) {
> > >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > >>>>>   			  __func__, inode->i_ino);
> > >>>>> -		err = -EFSCORRUPTED;
> > >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> -		f2fs_folio_put(folio, false);
> > >>>>> -		goto fail;
> > >>>>> +		goto corrupted;
> > >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > >>>>> +			  __func__, inode->i_ino);
> > >>>>> +		goto corrupted;
> > >>>>>   	}
> > >>>>>   	f2fs_balance_fs(sbi, true);
> > >>>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> > >>>>>   	if (IS_DIRSYNC(dir))
> > >>>>>   		f2fs_sync_fs(sbi->sb, 1);
> > >>>>> +
> > >>>>> +	goto fail;
> > >>>>> +corrupted:
> > >>>>> +	err = -EFSCORRUPTED;
> > >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> +	f2fs_folio_put(folio, false);
> > >>>>>   fail:
> > >>>>>   	trace_f2fs_unlink_exit(inode, err);
> > >>>>>   	return err;
> > >>>>
> > >>>
> > >>> Hi Chao,
> > >>>
> > >>> Thank you for the suggestion.
> > >>> I will add this to sanity_check_inode and remove it
> > >>> from f2fs_lookup as it becomes redundant since f2fs_lookup
> > >>> obtains the inode through f2fs_iget. For f2fs_unlink I will
> > >>> move the i_nlink == 1 check to f2fs_rmdir.
> > >>
> > >> Hi Nikola,
> > >>
> > >> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> > >> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> > >> inode, we will always call sanity_check_inode().
> > >>
> > >> Let me know if you have other concerns.
> > >>
> > >> Thanks,
> > >>
> > > 
> > > The issue here is that sanity_check_inode will be called only when 
> > > we initially read the inode off disk, not when it's already in the cache
> > > 
> > > The syzkaller repro does something like this:
> > > Creates a directory structure /dir1/dir2 where dir1 has
> > > i_nlink == 2, which is one less than it should. It then does
> > > rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.
> > 
> > Oh, I missed this case.
> > 
> > > 
> > > In such case what would you say should happen, should the second rmdir
> > > fail and report the corruption, or do we close our eyes and just drop
> > > i_nlink to 0 and possibly log a message that something isn't quite right?
> > 
> > I agreed that we should keep i_nlink == 1 check in f2fs_unlink().
> > 
> > Thanks,
> > 
> 
> Hi Chao,
> 
> Just to make sure we're on the same page, do you mean to keep the check 
> in f2fs_unlink as well as sanity_check_inode, or only do it in f2fs_unlink?
> 

Hello,

Kindly sending a reminder here, could you please
provide input when you have the chance?

Thank you!

> > > 
> > > Thank you,
> > > 
> > >>>
> > >>> I will send v2 as soon as I do some more testing.
> > >>
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
