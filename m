Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFABC2F45
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Oct 2025 01:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdAfTZwA4Pe5upF1fnxHgoHU1iYUgDRXwnFe+hsHx4s=; b=A1qe9CNx9SSQb5wxIW2fbG74Hc
	HEIjxL5KbaEdOM2u5Q55OXpmAk8+5TLukFzxYpA2vRTyotBIT5P2WmunFJnR2D8ZFdjE9ngeC3dS1
	FEctOJlj4urxWYWgYVtlVUcgZW1J5GoiOrJeKPclZQJ3mUQr1mVCy/GltGodruztGGSE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6H9e-0001Nb-84;
	Tue, 07 Oct 2025 23:31:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <skhan@linuxfoundation.org>) id 1v6H9d-0001NR-BJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 23:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=; b=LSY9BRyzw/T3v1mO0OvItSEGzk
 d4abjwSwIP3a2lVduSgjdk6WHz540fJJuqAefMub/w5wM4JMV9D3Plvg3tGaRrjqUxg0PgXX68Gv6
 kpRj4AtTr9vfmQSuhe+0Rp0hPCIH7+dWhZAyGnwLbApzIg8VJ2X5H2slFIwTt3r4rcmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=; b=DjH+eTYdoYdJq0+DcRGL9KUnWL
 bu5mqjNap1TYZCiWC1XgQINQdSRvrM2sfqSnWK3d1fmhSllkNvyBYtCmySMr7sqmA3OCm3jMG23gS
 wiy+Et+40190dtiFDJiGG9I0Z/VXsaL/rEVIXDu85L+bXHODt8FFYsah1HOVUFpru69I=;
Received: from mail-il1-f178.google.com ([209.85.166.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v6H9d-0006sm-JU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 23:31:38 +0000
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-424da17e309so72712065ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Oct 2025 16:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1759879887; x=1760484687;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=;
 b=VeXrzPMn0QPLN5Skrv/bSIa9axxN0qmqJ8vl0dO9W9xUIHin+J7Fr7Q9HHlXmuz+Hx
 mXItJh4jej2lvEGPeQ82BlkRg5u42RfuPRl8C7DdG2A4X2ttmx0zyXRMrw3mwku9MstB
 Zxbl49CDzzA4FPl0mbJ04Mrv4eUc58R8iajWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759879887; x=1760484687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=;
 b=AUokGeqpU0rrKP1+0j10hLFhoy2RrVYD7NEWutuIc/4YwJ20rKo4tH28Y8Q43Vry9J
 rEeyevIHaKAmORaBXiEb/I7c9eOCHdDjb8vDI37xTXAHzWGK5NHedSndaWOgFTGxgIrb
 3Q0Ow+fMda/vA6tW+GFPk2AZjywxyVvpnZyl3cPdgLjBWTwvPl9K7lGZW9TaeHyrKtL1
 mnHQxQHUjOz+s1m3hC3cEaT/GuKIV51Axy9dCmNIAByzrk6zOwSqBhOXVAcwF7w1ZFpZ
 bI3IG9kMc0A6Vmb9pIrW9xMUXn6t7aiYG8tjk0XFLhJ8Irj+ASwdlLRIUuy5E/tEmyBS
 4/Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYtBSF3eg2FcsCerhbb4Zbi1iasE2M6XwEbwBofykjzBfs7OttmQamYyhNHOBMhLG2RGnoY1GkVe2ic0SFI4TG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxgbgR63M+EYOyYjtj0mtSbHSdVM+FubFburTv8+HB36DB5z8OF
 SB4v0zETWdd5lOpqoEqdhD/7SwcFZ0Q/MKSS/mvUxXJfeony5nLesJcI0sfxhdnnBFt90/hlUQz
 sxShU
X-Gm-Gg: ASbGnctZdEZ3Q4XiAx5TwTSs4DsSgjsulerxFO9pUsxOJqM/9URjJyc3Zau1vPWCI3q
 TJMohrd8mMSRLMEFzNgptZRJoKuPArka5mOhGkC+Uf1gCheXRS5LgG/7zvFAiNH4s5MPrzMlHhG
 BjD70hdNkq3vcs5G1NTLcP0DM06/jEKInsGt/L9KZRYwwQXhim2TvCkEiK/0RHs6ez+HJGQqpMO
 Uwy0TAdrL1mKlL78sAQQIbVLBkRzQVQVm0DTtrke3xTQnVnbpvhNW+V5n5Z4yoeNZU6veh2aEfL
 N1PO33LWOPWbun95cUv7gId2AivLh+tOBORY2wPhXyz2Pc/X9YTR+kYNh10enZd0uQ3q4lxauCd
 Gt4nhNssBDjo9QkRjGoJNt+2feqTM+YFZtdsZQxnhOJCwx8YuPcUNL8lsViBurg7IyYzE/w==
X-Google-Smtp-Source: AGHT+IEtLhevApkwpIKEq7+fQ8je8BxgSHsqBpZsQ2zLcnvaHNcZe5ZzCLwO2QkGpik5nYtNYr2I2A==
X-Received: by 2002:a05:6e02:2785:b0:42d:8bf8:967 with SMTP id
 e9e14a558f8ab-42f8735b606mr12490955ab.13.1759878481614; 
 Tue, 07 Oct 2025 16:08:01 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42d8b281664sm70947345ab.25.2025.10.07.16.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 16:08:00 -0700 (PDT)
Message-ID: <efdafa7a-3d24-4a44-ae40-4057b0a8bc51@linuxfoundation.org>
Date: Tue, 7 Oct 2025 17:08:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251003134731.470392-1-zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/3/25 07:47, Nikola Z. Ivanov wrote: > Current i_nlink
 corruption check does not take into account > directory inodes which have
 one additional i_nlink for their "." entry. > > Add additional che [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.178 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6H9d-0006sm-JU
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
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/3/25 07:47, Nikola Z. Ivanov wrote:
> Current i_nlink corruption check does not take into account
> directory inodes which have one additional i_nlink for their "." entry.
> 
> Add additional check and a common corruption path.

How does this change fix the problem? What is common corruption
path in this context?

> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

How did you test this patch? Can add details?

> ---
>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index b882771e4699..68b33e8089b0 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   		goto out;
>   	}
>   
> -	if (inode->i_nlink == 0) {
> +	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		goto out_iput;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>   	}
>   
>   	if (IS_ENCRYPTED(dir) &&
> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>   	return new;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>   out_iput:
>   	iput(inode);
>   out:
> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto fail;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>   	}
>   
>   	f2fs_balance_fs(sbi, true);
> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   
>   	if (IS_DIRSYNC(dir))
>   		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto fail;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +	f2fs_folio_put(folio, false);
>   fail:
>   	trace_f2fs_unlink_exit(inode, err);
>   	return err;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
