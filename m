Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4641C2A6CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 08:55:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX5wRFK3lWQ3mUVpapkjH0kWpVLhnVvs7PArPx6eppY=; b=fjkdiOW0qkcOw28u21fqnvozLO
	9ATtaQYlX1b0yUigakWM5cSN4rfhBCUPWyfBL/jkIBbnbd++G0hu8iR54KcSeGSZ4fVbBywKHpNop
	IHrFRWn3QiaX1uGtqQabbAv1i29gDc5scWtjj7MJZ54kwIAbJQk6EqunUsSLgm8Oj7/A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFpPE-0001ux-2W;
	Mon, 03 Nov 2025 07:55:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vFpPC-0001up-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 07:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=; b=D8BHoFQoWLRy0s+KSdutHBc0d+
 o/xZ0HaizqOtIMr8bCK6HyZvf6f4cPhxDNLpjNnjF2pw7QJhxO47rRIvruE5eV3Hty062JVggAH8h
 YS2l1MaVN525mH6KMBJd8K9IgLDpDi8q+kwunhTCp51dX1wPteqrwKrXTbBpEL/ffjUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=; b=k2w90umXVmz2IQdD72o5gCaAbT
 UvBebRe8mZHbb218HaHrjVSQWxDpubA98j/LRrK4OJj4T87rOHOtzmIlCvp3KrWt6aFRl8qVLIeIx
 aUJ3FifxmGAEiP/3B4378QcAIG8DNNLNx/ZuELUaxdcu77ZzrfHB2XOQuN0JyYVsV1rg=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFpPC-0005yb-BE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 07:55:10 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so2087183f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 02 Nov 2025 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762156504; x=1762761304; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=;
 b=JNfqlMtZZkLJXC6v/aPmAHxGWEN7gMKwMTYBZxzbaVKGiw4uzwhegxxd080vCpGs0b
 6JmWb5HfqY6PjoD6pRUWUB4KyQ4cbQkqIbfwwUdsLRx7Rpgj3Dx3MtubPpskFrsHIkD3
 vJuhQFUCFiMGuM5jHcdMgYIT4uSCLT9fuKCh2ooEkl/4VeYla9mlC2bL47/yhpYs3S49
 gvtzY9dPGiSUNyatGHBCbCVpNT/HLMXrjNMW2KyTAOQBhBVHU2IEGkh4whZ2YlXAV4Jl
 alzIoBx+BOTE7TA6a/8TA7xBWs59jPNM09vxzNtB+Aq1QBVXwDncfBUGGDyvtJG4Zl5Y
 LVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762156504; x=1762761304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=;
 b=Wq2lQBpT61CJ94kGhpF9Tr/lARNxmE7KaS6njxA5xhwtz9VdLYezabwA/gYxyqyiFO
 3VgKjO6Jg0KJNd2mWzdxaH5fHUl5WtFjzproNdQhQGHopQ9KwtJaiD0W6DTFz+QhQDQy
 OdT3dx5T5ks+SNp5RR2zMXmP7kMANZ/eai0jGjAeMIo5pSWHt0nZcIveb2q+4t4oXxg/
 QLVCaE6DkzsNO4/WBPXg+OiVlYenWFqvNnYjtmEcSdDzAQVzeK6/B0856+O2iVEZ7RQ/
 tcXRpgUZMUTClE+I43rv1V2Ehm/sydGqfm4+sTUqzDGkMSyHfAWdx/SV5PM3LGsG03F7
 bcgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUvO8EWL3wXqPFU+/niQGCIENcQvRUL1ACB+g2LAlUH+PB5k42gpD/3rP8AcNgsIJf2E8FOqMkQSHwohQw9+i4@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwKt1gbW3hdqQJXSdg488QeACTfYLNG9U5SeoRTIbS73sslvoqC
 DFdNov4VNdz0yYWYV0TJzoJ6oO7Ybruz5S7/KBsfDItJm7hKecsqkMQH
X-Gm-Gg: ASbGncsUxiH9yjU26VNb966O6qY5CzUCabmuzlGSxQAikqnPRXL1z8IIUwvL3tIzkbr
 0NCBMYF7M1pjMLQj55zxOzPvS3fNrbq8YUby2YfeKcnbI4gz6+0/TLajqRDWu1gaZ8L/jd0cfRP
 vAVvT0I7J1mhRNKmsU5k13+T+2gImsbVzlodk0ekGVFPSHMbBaoogHnD1HrlIJgAFWX1Vsju3is
 TvhrUGaYxkKrmlz5rrRK09SGgfgMnoNoHGdP6oL2t/RetPNApwqK9zQrUXJ7EUIHGvT87ykAHWf
 43qFujvCPrUBWcc4r9BlZj2b8iOkk655wADQ8urPYseosWmeZOxgFdljDrrgQMXC2n7WIku0VvH
 prQg1HzrEfEDzB6Js4/w/iZgPbFea7gAG+JA5u2iKB6qmW5qw0GHWWaOkWmqmevzDPKu8N/LWQ4
 fGep+T98uyvCyNhBPBWdSMYg==
X-Google-Smtp-Source: AGHT+IFyHdL5vinzqBP7jHakygrAZQoPQph4ogdXR370JssBAjuF23hFYbiA6u4HtF1rj6X+jdGEDA==
X-Received: by 2002:a5d:5d02:0:b0:427:9d7:86f9 with SMTP id
 ffacd0b85a97d-429bd6a8f88mr9630526f8f.47.1762156503565; 
 Sun, 02 Nov 2025 23:55:03 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1405fffsm18688238f8f.45.2025.11.02.23.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:55:03 -0800 (PST)
Date: Mon, 3 Nov 2025 09:55:01 +0200
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <pcxf66ac2yjkqyvhb6xgbk6jiihcejuncgbblkewz6rs7i5uzt@m6yjin7t67is>
References: <cover.1761993022.git.zlatistiv@gmail.com>
 <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
 <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 03, 2025 at 10:35:17AM +0800, Chao Yu wrote: >
 On 11/1/25 20:56, Nikola Z. Ivanov wrote: > > Add check for inode->i_nlink
 == 1 for directories during unlink, > > as their value is decremen [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
X-Headers-End: 1vFpPC-0005yb-BE
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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

On Mon, Nov 03, 2025 at 10:35:17AM +0800, Chao Yu wrote:
> On 11/1/25 20:56, Nikola Z. Ivanov wrote:
> > Add check for inode->i_nlink == 1 for directories during unlink,
> > as their value is decremented twice, which can trigger a warning in
> > drop_nlink. In such case mark the filesystem as corrupted and return
> > from the function call with the relevant failure return value.
> > 
> > Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
> > sanity_check_inode in order to detect on-disk corruption early.
> > 
> > Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > ---
> >  fs/f2fs/inode.c | 10 ++++++++++
> >  fs/f2fs/namei.c | 15 +++++++++++----
> >  2 files changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 8c4eafe9ffac..089cbf3646f0 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
> >  		return false;
> >  	}
> >  
> > +	if (unlikely(inode->i_nlink == 0)) {
> 
> This is a possible case, as an orphan inode may exist in filesystem after sudden
> power-cut.
> 
> Thanks,
> 

Hi Chao,

Do you suggest that it should not be wrapped in unlikely()?

I also now realise that I intended to wrap the "else if" case
as well but I've missed it in the final patch.

Should I resend the patch with both cases wrapped in "unlikely()"
or would you suggest otherwise?


> > +		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > +			  __func__, inode->i_ino);
> > +		return false;
> > +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		return false;
> > +	}
> > +
> >  	if (f2fs_has_extra_attr(inode)) {
> >  		if (!f2fs_sb_has_extra_attr(sbi)) {
> >  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 40cf80fd9d9a..d13077bad482 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >  	if (unlikely(inode->i_nlink == 0)) {
> >  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >  			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		f2fs_folio_put(folio, false);
> > -		goto out;
> > +		goto corrupted;
> > +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> >  	}
> >  
> >  	f2fs_balance_fs(sbi, true);
> > @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >  
> >  	if (IS_DIRSYNC(dir))
> >  		f2fs_sync_fs(sbi->sb, 1);
> > +
> > +	goto out;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > +	f2fs_folio_put(folio, false);
> >  out:
> >  	trace_f2fs_unlink_exit(inode, err);
> >  	return err;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
