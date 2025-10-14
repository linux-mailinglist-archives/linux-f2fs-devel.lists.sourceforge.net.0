Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2EBD94C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+2wTUSbNjXQ8qogbdgeTITcZ5396ocLrdHAq50CH3U=; b=J0CXF0O+OjfdJ2nSOWLciomizE
	zcfXTXgZQNaswvjUfIeBYF/eMqxKEzB3muO/JhB4LK2FIDZ63Rx8hxHIMZJfnlfGHXcx5zM5vaman
	bMnmxL/MYOhpll67+aC+H6GzNoI6zSHjlL76hMGdkGczMJFAcor+Rl7zTaGKJ7X86/7A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dxu-0007Vm-5E;
	Tue, 14 Oct 2025 12:17:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1v8dxq-0007Vf-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=; b=h03xnLh/gT7o9a2ChM1HYRrvLc
 rB0V7Kp4cgM8hgqeQOAVCsvQBNbLpTyX4wx/d4HMXZ5LPtgXYUhyKoRxtraPXMfblIncgjXZ/jlg5
 RHSR22xTz1pK9qC1H3XcCNgUuGHTC9fLpRd2JvgsyAxS5u7ZBXF9eA2HqF75VBX941S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=; b=lOq9bB+oDEW5pa6QgaQsHNDFCE
 zqv9aSm59oBx87SCHlufgh0Ptks4rPrye42gF6eQRRT0dS65BdRDzSrSZfBS1XAOzEBjXu1WwZVs4
 1YHXZBtnt9TrcUgzpD6f4HyTqQoBx9qTeakyIc6FTt1rWMWosRq8hEI/PNZZLqhbXBSo=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v8dxq-0001ub-4k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:17:14 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so853114066b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760444227; x=1761049027; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=;
 b=IxuTtz1c9l0HX5szxplR7RRsP1xi2w3W0HxcXNdIMNqdVB/SRFWPco3BXgrcfkPp0q
 mE91JS7e1sdJrSOTspsTtjgCICGcXdztYAvOt3QOjOziWmLbek+gRDMl4OUaUYJojuKB
 rRYDRhCCoFW99k6ni+PsCO/paNgBivYCSS5OndPXLVMKXaT6auBnBGzWBSs1vrcFPTMk
 aRCyR7Hb1CDqRAjcf4kB/mbyxlDXNhFnPoj+FkIUdodx89CpU3KdCDVBgRq1F5vNA+9D
 yinX8pS43BVbL8t/42eR88Ys6A4nYwu055+jV/rlX+Ug2r+Vp32iX9sWHqUD7MvfT4N6
 xkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760444227; x=1761049027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=;
 b=bHEaztEe++CXP05fpwU2p/9pQi4LxD2T4nMhFLWR6QcQGanA5Xyz3H0ffRwaV9tOhB
 z1fkb0fI667ZOrXdFkhDmPYRjbgjdgAthpAMZc89O/6G2tyeNG/r9KnJgfkZ6PfzNAZ4
 hcLo+oCbrDfFnvfa0t/+4sdkTstJGLyTtu1Kd4xGEV6GIFyh55UMU/XS65f+q2fgHUvu
 AXQqylWIKEgXMKAGHgJdRalkrPWF+H7ev5J42zEDpJ97HzJP/qIq9bLTb2IilrFaqT+U
 DEN9IrR+fvXSO8Z8IhUtMwVbLtFAi9h4bpmYxBdj9rs6+JA3Day4Gp0VWJeMAiBPr9Iy
 SA1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo43DilfIaD5BG4nP1hct8umDo/EjFMxy5mVjXNbrqMbxybvcKHhW2ieGvo1KR/Ed6lPvsKUlz1E+LwmUXE+w2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIY/5cSZcldV5GrizaABmJdiEkGcb77Kkc5CpPrFp3oWLlovHz
 1FURtNZ3h317RF6c0TpjIxpDP6T7rHTckMfnKKkM5A6NboR2IIN+JmCS0MaQQQ==
X-Gm-Gg: ASbGncs/nnIO/awn42VYgfX6DCLrmdTzMc+Y5STYAnljQjhH4KqO5z6S29LtXwsq8kG
 fdYfKXB3/yXZJWmfNWJh8Lu2M/I88xVYyHkCoXfn5egwYNfFLZfbrBVnCh9hEeynBV8LRj13I4+
 fzyZnFHGnep6IwKVwjC/Lr8SaTJ83wZ6iyOSKMtwMf6zq4lElLleVD+FEJRvSdGUPqnsZeWRRO5
 gKEfXsHEeoUTU3TwaHI7yElwm09Ws9cpJo3ZFxiYiol8rt92FoIzepssNAlVZSLJxZokXGcP6/m
 uhpHkxFasUL1qCr31vlsBVb5bbO8ANNulJJOEyhUAwMsiY63DcqmKItkgAoTmFBJc2wFJzwlL/l
 WRkL0jbcURNjwgeBkcCYLorO9DeUfi7RimKtT3Bbaed2Y5B8Dw21BNRgGszBp1adrcHzMJ+U96q
 GS1uRRXY5o
X-Google-Smtp-Source: AGHT+IGq27w45QLYd+XODJVVnusgATVtS0zDzQLIBAdrmNxLtWSM1Llh13WXNkkw6lvcW1Z8zM/+Pg==
X-Received: by 2002:a17:907:3e22:b0:b3e:b226:5bad with SMTP id
 a640c23a62f3a-b50a9a6d8a3mr2542115566b.8.1760444227255; 
 Tue, 14 Oct 2025 05:17:07 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c129fasm1159133366b.43.2025.10.14.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:17:06 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:17:04 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote: >
 On 10/13/25 05:19, Nikola Z. Ivanov wrote: > > On Thu, Oct 09,
 2025 at 10:54:40AM
 +0800, Chao Yu wrote: > >> On 10/3/2025 9:47 PM, Nikola Z. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: syzkaller.appspot.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
X-Headers-End: 1v8dxq-0001ub-4k
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

On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> > On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> >> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> >>> Current i_nlink corruption check does not take into account
> >>> directory inodes which have one additional i_nlink for their "." entry.
> >>>
> >>> Add additional check and a common corruption path.
> >>>
> >>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> >>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> >>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> >>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> >>> ---
> >>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >>>   1 file changed, 20 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> >>> index b882771e4699..68b33e8089b0 100644
> >>> --- a/fs/f2fs/namei.c
> >>> +++ b/fs/f2fs/namei.c
> >>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>   		goto out;
> >>>   	}
> >>> -	if (inode->i_nlink == 0) {
> >>> +	if (unlikely(inode->i_nlink == 0)) {
> >>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>   			  __func__, inode->i_ino);
> >>> -		err = -EFSCORRUPTED;
> >>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> -		goto out_iput;
> >>> +		goto corrupted;
> >>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>> +			  __func__, inode->i_ino);
> >>> +		goto corrupted;
> >>
> >> Can we detect such corruption in sanity_check_inode() as well? So that if
> >> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> >> flag and then triggering fsck repairment later.
> >>
> >> Thanks,
> >>
> >>>   	}
> >>>   	if (IS_ENCRYPTED(dir) &&
> >>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >>>   	return new;
> >>> +corrupted:
> >>> +	err = -EFSCORRUPTED;
> >>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>   out_iput:
> >>>   	iput(inode);
> >>>   out:
> >>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>   	if (unlikely(inode->i_nlink == 0)) {
> >>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>   			  __func__, inode->i_ino);
> >>> -		err = -EFSCORRUPTED;
> >>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> -		f2fs_folio_put(folio, false);
> >>> -		goto fail;
> >>> +		goto corrupted;
> >>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>> +			  __func__, inode->i_ino);
> >>> +		goto corrupted;
> >>>   	}
> >>>   	f2fs_balance_fs(sbi, true);
> >>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>   	if (IS_DIRSYNC(dir))
> >>>   		f2fs_sync_fs(sbi->sb, 1);
> >>> +
> >>> +	goto fail;
> >>> +corrupted:
> >>> +	err = -EFSCORRUPTED;
> >>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> +	f2fs_folio_put(folio, false);
> >>>   fail:
> >>>   	trace_f2fs_unlink_exit(inode, err);
> >>>   	return err;
> >>
> > 
> > Hi Chao,
> > 
> > Thank you for the suggestion.
> > I will add this to sanity_check_inode and remove it
> > from f2fs_lookup as it becomes redundant since f2fs_lookup
> > obtains the inode through f2fs_iget. For f2fs_unlink I will
> > move the i_nlink == 1 check to f2fs_rmdir.
> 
> Hi Nikola,
> 
> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> inode, we will always call sanity_check_inode().
> 
> Let me know if you have other concerns.
> 
> Thanks,
> 

The issue here is that sanity_check_inode will be called only when 
we initially read the inode off disk, not when it's already in the cache

The syzkaller repro does something like this:
Creates a directory structure /dir1/dir2 where dir1 has
i_nlink == 2, which is one less than it should. It then does
rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.

In such case what would you say should happen, should the second rmdir
fail and report the corruption, or do we close our eyes and just drop
i_nlink to 0 and possibly log a message that something isn't quite right?

Thank you,

> > 
> > I will send v2 as soon as I do some more testing.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
