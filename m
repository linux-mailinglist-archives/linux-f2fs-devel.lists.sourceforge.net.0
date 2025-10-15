Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9327BDE8E3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 14:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FOdzBnDcdzzjqOtgB6BEqJMARcDElqjT6WwPwXdRuk=; b=mbOv9om9ZHdd39K6AW1F5GhRVh
	DRJwUP3HmVe4ptfRUv+TfezIrvF6tUFsBPhCgQLn6xqnRIDeNP1jVtE6RPD0tTcibxBThOr+nstQd
	PY64yU1xJCLS+lSuK84ZOz4dMx+nf5ZDNrGgCJYdBHEtaVCtvWimTFufoPoqnoJmPQQk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v912m-0005qa-Sj;
	Wed, 15 Oct 2025 12:55:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1v912l-0005qT-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 12:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=; b=FPwCiywQaGgHHsznLF/HS/cBeC
 /1s4Ar7a1Q1BkuIHDrZbnea3crT1iMC1z1TqmoKuZmYQ4c/zG856WKlQd6Ki/HK5tg3Y7qvd8v/0D
 hros39nyQzgDOXTyz623/v5tzlwpUOUkfpSJDnJpKSNVCiwn+TGk9WZc239RdjyCQOuM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=; b=PzzUMhCwtvCmZ+v0HtZHVRSiXj
 X3ihjnN33Cklj41GL11nSvkS8QSumf+bdWNdkB9LqbRp/Zh78HqYxJy/yvpg1PDFhsePlNQWgknl9
 STfMV1cQz1/DrOOjjns+fAe66Uayb2+HWTpXzfePDV0sJr+saPVddnuKT0THiuUey+E0=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v912k-0000j6-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 12:55:51 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6318855a83fso14612717a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Oct 2025 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760532944; x=1761137744; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=;
 b=EeXr3ivUihmp4grXpf24ioeBR1z7JoMmcgmw5fGeZovqBal0FZE6al1YYU+fhvysxy
 aJnZMnxIvnl+I4Xlj2ZgreqQMlZXSlKkH+jn2YGaxrJOxiADxhWARRxz2/nXLUaMs+RO
 Blw9iCOtMXWiUCx0w31QNJPCmubhtIqEnKA2ntZ1QGxQwvnVsp7TbgkP9FBwWHnfvGbi
 SLzKVqFBlvxD84nJIK4Ai/HY62GPbyrjq+7PJ6puQnlLmDqvRk/uGhVbBdRv0Q2F62WF
 /GzG8jWPGvUo9XRJ2M2w3zYNTWIJWsJa/nf1iyrr/ivf9160lZzNSHNKtLywX1OitCM1
 Uj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760532944; x=1761137744;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=;
 b=RtQgtxAdLQgvdIyR5dyTNyxxbX5B+P5rg6sh45JmdyQnnUYuONPt4oKsjB6vkBielK
 phtl/tpFBSbIeye3HZMX/ktfhfb1Tx+nw7H1+N6TsTZA+pCPWZf+fqY6bIwafoe85kgL
 ZFlTTBGPcNBVGKIxzbAIIJ6cwhK6bkxUH4Nm7ihMDq5Oh10dJNRKeZAH68l4DLxUJLXf
 8vOy6z5sHKg1BwZUhB+Fah8o86Qd2ByWrbras94CGpvKnxD0lI/KSm5GzFlc3Rm04p/A
 xWE0qwI8orl9uxxTbq4r8/u7qiVnfLIfGQXmKwHz4EkgG9Gh42mh4jVNaTudM9dTr95r
 ofYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMSfPISYEFSH+rBa9D2WAzjyuAlwRErdYMDUZZVkAQpai19BDQ7BunDu/efZQhmlC089T7IWBbiwnxGdyAVDbE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yydr/yG4hz7uIItkOO1wY++XSO6tGBqaMm8c0X5hMMceyr0gPB0
 F1FAAg2nEyboTLE5PyvfKVEcy4qbrI+q4WkfrcZntKb3sTFGEV7ECX0j
X-Gm-Gg: ASbGncuxaHtJSeiLSUEr52hjdiG3neZaEvPDN6Acmw6fdQHS+WTPU+IhgCBOR5D9uIh
 xD/lADIJIa+gWAyHRuaDlFcj5Uhb2XqOU/XpcfiERbBCpKXTCOXMxlqU65Sqgf/GduolnJ04C1G
 tGtEmvp7VaDgcC/oR/Gdee9Thagn/0pyDyckBJt7Uq7nTDvf/9FKb2IVmxxQvWFhKfpRfMfrt8l
 /So2FXHTwaYl0fk5WrlYtojmXUd7FBKyAk7dnnnAZRFvzibRLsTxXUxKAHDeb/FEL7PAopW/7nW
 OeZiErIOwINJUkf6ImqwQrR0gTedEjjhx1X6b86Z4UHx4ehpmqrQncvP8i8e2SEy3iQq8N2PXSS
 6rrY0U2Kp/HbIdgrCBNRFsT+FWVj3tDkiOrfzbhM05NOaUAC44z4MUo2tyNDBxh70oSey6YPkvh
 Jf8vLIp6q3EamldCrRuG4=
X-Google-Smtp-Source: AGHT+IFPmVnwrdUH0AaXcNBVVpT7odSzD/MA2yjUQqiuRk8y1WRUilesmSuJ2NFLYUJFWJPhPBgpHA==
X-Received: by 2002:a05:6402:5203:b0:62e:e722:a3c7 with SMTP id
 4fb4d7f45d1cf-639d5b8b60emr26613009a12.9.1760532943620; 
 Wed, 15 Oct 2025 05:55:43 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63be969163csm2115271a12.13.2025.10.15.05.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 05:55:43 -0700 (PDT)
Date: Wed, 15 Oct 2025 15:55:40 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
 <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
 <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote: >
 On 10/14/25 20:17, Nikola Z. Ivanov wrote: > > On Mon, Oct 13,
 2025 at 08:53:04PM
 +0800, Chao Yu wrote: > >> On 10/13/25 05:19, Nikola Z. Iva [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
X-Headers-End: 1v912k-0000j6-Ij
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

On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote:
> On 10/14/25 20:17, Nikola Z. Ivanov wrote:
> > On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> >> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> >>> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> >>>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> >>>>> Current i_nlink corruption check does not take into account
> >>>>> directory inodes which have one additional i_nlink for their "." entry.
> >>>>>
> >>>>> Add additional check and a common corruption path.
> >>>>>
> >>>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> >>>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> >>>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> >>>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> >>>>> ---
> >>>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >>>>>   1 file changed, 20 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> >>>>> index b882771e4699..68b33e8089b0 100644
> >>>>> --- a/fs/f2fs/namei.c
> >>>>> +++ b/fs/f2fs/namei.c
> >>>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>>>   		goto out;
> >>>>>   	}
> >>>>> -	if (inode->i_nlink == 0) {
> >>>>> +	if (unlikely(inode->i_nlink == 0)) {
> >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>>>   			  __func__, inode->i_ino);
> >>>>> -		err = -EFSCORRUPTED;
> >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> -		goto out_iput;
> >>>>> +		goto corrupted;
> >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>>>> +			  __func__, inode->i_ino);
> >>>>> +		goto corrupted;
> >>>>
> >>>> Can we detect such corruption in sanity_check_inode() as well? So that if
> >>>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> >>>> flag and then triggering fsck repairment later.
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>   	}
> >>>>>   	if (IS_ENCRYPTED(dir) &&
> >>>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >>>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >>>>>   	return new;
> >>>>> +corrupted:
> >>>>> +	err = -EFSCORRUPTED;
> >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>>   out_iput:
> >>>>>   	iput(inode);
> >>>>>   out:
> >>>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>>>   	if (unlikely(inode->i_nlink == 0)) {
> >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>>>   			  __func__, inode->i_ino);
> >>>>> -		err = -EFSCORRUPTED;
> >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> -		f2fs_folio_put(folio, false);
> >>>>> -		goto fail;
> >>>>> +		goto corrupted;
> >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>>>> +			  __func__, inode->i_ino);
> >>>>> +		goto corrupted;
> >>>>>   	}
> >>>>>   	f2fs_balance_fs(sbi, true);
> >>>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>>>   	if (IS_DIRSYNC(dir))
> >>>>>   		f2fs_sync_fs(sbi->sb, 1);
> >>>>> +
> >>>>> +	goto fail;
> >>>>> +corrupted:
> >>>>> +	err = -EFSCORRUPTED;
> >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> +	f2fs_folio_put(folio, false);
> >>>>>   fail:
> >>>>>   	trace_f2fs_unlink_exit(inode, err);
> >>>>>   	return err;
> >>>>
> >>>
> >>> Hi Chao,
> >>>
> >>> Thank you for the suggestion.
> >>> I will add this to sanity_check_inode and remove it
> >>> from f2fs_lookup as it becomes redundant since f2fs_lookup
> >>> obtains the inode through f2fs_iget. For f2fs_unlink I will
> >>> move the i_nlink == 1 check to f2fs_rmdir.
> >>
> >> Hi Nikola,
> >>
> >> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> >> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> >> inode, we will always call sanity_check_inode().
> >>
> >> Let me know if you have other concerns.
> >>
> >> Thanks,
> >>
> > 
> > The issue here is that sanity_check_inode will be called only when 
> > we initially read the inode off disk, not when it's already in the cache
> > 
> > The syzkaller repro does something like this:
> > Creates a directory structure /dir1/dir2 where dir1 has
> > i_nlink == 2, which is one less than it should. It then does
> > rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.
> 
> Oh, I missed this case.
> 
> > 
> > In such case what would you say should happen, should the second rmdir
> > fail and report the corruption, or do we close our eyes and just drop
> > i_nlink to 0 and possibly log a message that something isn't quite right?
> 
> I agreed that we should keep i_nlink == 1 check in f2fs_unlink().
> 
> Thanks,
> 

Hi Chao,

Just to make sure we're on the same page, do you mean to keep the check 
in f2fs_unlink as well as sanity_check_inode, or only do it in f2fs_unlink?

> > 
> > Thank you,
> > 
> >>>
> >>> I will send v2 as soon as I do some more testing.
> >>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
