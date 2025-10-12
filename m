Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF2BD0C9B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Oct 2025 23:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ4NAjPp+MKdSMhnARqTWUsxxw3W68B8Bz+1AtPlbjQ=; b=DWCxyGRSZViicaFHoUySvS3jG1
	uNm8aLZcKg4Dx9YqYkosu4fR/XEoAcZZfeeVTB9Wxjw/i1r3dooarxbnPZwt7iqtXk6V2s/o2N5F7
	VbsnviprVPBd6ABWpWBxCChkCtoVXiASXW0R7/n2MkR3H3S72E+PvrCZGtIRgxOW2lc8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v83TN-0001R5-Qb;
	Sun, 12 Oct 2025 21:19:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1v83TL-0001Qv-0W
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 21:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=; b=UVGGICJhUh+zyOPsgta/Gab8Bn
 27z1HTx9ZcKnJD2og7GJSDIijA1rbmrLXEO0AXsvX5DKSXNEuzu9SYJrMJ4r5Sof1V8bIPKCNYvaU
 O+0mylk1miEr5xVqxWXMhYnf5BXo9l2VwyHmAHttBFwQXtAO5R/973NhQ5g0Affvp/ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=; b=XhiLetifzNFXNxGudx9JbDQu98
 RiLVmIJjtFWPS9zOHmsUR5FvdrH/GWDif6Dwf5XJpIbThk0Y5bSIDrupQNN51CqK4ge52BfHlwzhG
 5EMAx3VbVrEF0WKR5f4hHUR/w1IITNnZQsUFhv9GrYvMGPqub5zFgbkMJ6pMJq2dZd7Y=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v83TK-0003gF-H1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 21:19:18 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so2807874f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Oct 2025 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760303947; x=1760908747; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=;
 b=hboKV2L07o7AsR0vTZdlpNdZRfpCaKbNuHTNL60p6Bq0rjvQa/wwidd5stgJBVboXJ
 8O2aTPGC99GXd0Dh/xI4AKG2vOl5Qp/Pj/GKo8FPrC/+HQODFfD6bN3u0xPX/tEDb40U
 +T9OaXbGYOtrBnhv1kywlpbRQJEt1XH0lQiLAF65P8WGC2h10gN5peA8cIJdOU5nhu+M
 MSZm/dlEkywJOzGtY1K8JC/FlQ6gKXf8wJ8G3N5FyV+NtettBWFpBpbzZrggBihxonXY
 0YTQQzzUZUWQaPLoYHpVgNvRD8etWR9otmQrbWz4/Lj7aNW52Qt/o0fauxx30Zv4bxcI
 NNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760303947; x=1760908747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=;
 b=Zg8lFmDdPFEWfR0XTSlGv2uzv22ABF8T7VNkk18QWcPLRhNp+AW0GigBNqg+l6e1q6
 okZHjo+Hb7aYQfU0LSrSXNR+rtE85SugbWDgiPb6LXEsV+iHbAmZwrK0FYldvjj7aCS9
 MEKrWJP7gjnf8ghNH5whKaz1wzbmjpuvC7NrXX0mgzggE/YodpVsq/lwyb/BF1CEihVT
 nGNrIiVDuyQb2Q2uU+E968D7aJsHyeXI0v3j6GOFDKl3ngK+EzIKsnXQaUV5rNiAfO6E
 lH/amACp1WJhG8+nYxNkzY/icFm0bS41k7sW6HkQl7kBp59D0Se8hFuCsGvGFN/h19n/
 EoZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb45aldccCTIK5MlJZQALR50D9kuTq6t+m+jCaw1/jDa1MPTXRDypfJJ/u+EAW6k0gtEXr/TsEpktX3TDwsn3q@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz/nAjZZvJCLmNk5eFBfYVjT4R2wum4V0O9TuMjCdyiz2LqMp2V
 p9J2NXvG2Yf5Hn8Xx/vWMso0mxq4gZZ+gy0P5rGTlqSDyO/vF25DBGqI
X-Gm-Gg: ASbGncuY9VLaTOH4PX0K3uLAx7Vt9338W6cARRbPESMqrxyS3Q4EVOa10CbRFYjQ4Gc
 Wf+CxH1M7o/MK3oQTHCNqhcnesZ/4snjNhzQc+7tTg9iHL5GaU/F3EQNPHXziTHR5TLqXJClQ+Y
 paXbkk+bcVEmC8oDu6lm9FKqBjSk7TIG7pt+F7CcRGq1DsbkyGB2cYHtXYYEQi2V80V4+mrLuUd
 BS4rifEtnnoZodvQMT0ctcLMSuMMUTYmRQ043GTtbvG8OL8IBMraqwq0L3gguQxrTg66+vQNxA8
 SFUwpwwY4n/yMWqsl9hiqj0qcnvs9SN6IuD36R1WSF5vXxRKp3af0O7FQrCH0+O2IbJYOka8PaI
 bv/J0SyXt/IIRMQJyoRt76xOiugaiZmrVVGQJ2yx9Yw/xH/T4k5uYLd/XanCHUPILrqAzbHNDwO
 uZh80+eimoXR7KjGfyHRk=
X-Google-Smtp-Source: AGHT+IGjHlzwxTlSwDIo8bVlsq+pwRAcXzYI1RxLsxjm8COk+bFjmzs7HwuYQVnOLc3GhJHNohSXJA==
X-Received: by 2002:a05:6000:2c11:b0:3ec:dd16:fc16 with SMTP id
 ffacd0b85a97d-4266e7df779mr12010154f8f.43.1760303946775; 
 Sun, 12 Oct 2025 14:19:06 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0987sm14723783f8f.38.2025.10.12.14.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 14:19:06 -0700 (PDT)
Date: Mon, 13 Oct 2025 00:19:04 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote: >
 On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote: > > Current i_nlink corruption
 check does not take into account > > directory inodes which have [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1v83TK-0003gF-H1
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

On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> > Current i_nlink corruption check does not take into account
> > directory inodes which have one additional i_nlink for their "." entry.
> > 
> > Add additional check and a common corruption path.
> > 
> > Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> > Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > ---
> >   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >   1 file changed, 20 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index b882771e4699..68b33e8089b0 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >   		goto out;
> >   	}
> > -	if (inode->i_nlink == 0) {
> > +	if (unlikely(inode->i_nlink == 0)) {
> >   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >   			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		goto out_iput;
> > +		goto corrupted;
> > +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> 
> Can we detect such corruption in sanity_check_inode() as well? So that if
> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> flag and then triggering fsck repairment later.
> 
> Thanks,
> 
> >   	}
> >   	if (IS_ENCRYPTED(dir) &&
> > @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >   	return new;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >   out_iput:
> >   	iput(inode);
> >   out:
> > @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >   	if (unlikely(inode->i_nlink == 0)) {
> >   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >   			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		f2fs_folio_put(folio, false);
> > -		goto fail;
> > +		goto corrupted;
> > +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> >   	}
> >   	f2fs_balance_fs(sbi, true);
> > @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >   	if (IS_DIRSYNC(dir))
> >   		f2fs_sync_fs(sbi->sb, 1);
> > +
> > +	goto fail;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > +	f2fs_folio_put(folio, false);
> >   fail:
> >   	trace_f2fs_unlink_exit(inode, err);
> >   	return err;
> 

Hi Chao,

Thank you for the suggestion.
I will add this to sanity_check_inode and remove it
from f2fs_lookup as it becomes redundant since f2fs_lookup
obtains the inode through f2fs_iget. For f2fs_unlink I will
move the i_nlink == 1 check to f2fs_rmdir.

I will send v2 as soon as I do some more testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
