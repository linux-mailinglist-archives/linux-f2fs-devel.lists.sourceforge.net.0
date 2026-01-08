Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A9D06748
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 23:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfyqmVJ0I+6Dv7qPyLFzxdPo/vQKFWMRTYi3t99SzOc=; b=ISezKdXhO7LPoOkeg9ZRhiBVm0
	5mgGBzP9XA2zSa+uLmWKmyO3Huu8PFU0hfHcI8ZxHI9d+BbTTwLyAEdzmye+VMkoAo7iDnxUrDeEm
	EJx0tbN3Vr4Do/aEGkGjCvuTjZPPRc70C5lli+lDuBkHLTArDErsT6cPzocI8XVn80zM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdylU-0004dR-2w;
	Thu, 08 Jan 2026 22:46:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight.linux@gmail.com>) id 1vdylS-0004dE-Ky
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v23yl1XRlI6/R87v8YLz/T+/j8Q6Psx2F9P+y+YgX4E=; b=ExnpSf7roVls9V/eL7ifbnbeae
 yJjXlDBVfDW2il5pe84sXpiJaK8JV4/36OLNH959D4LscZGJn0WGub33Bo5YG9LR7rvg6sKFmqo9/
 KqWyFcCC5dz60w5XwOGBoTFFmPASIvH7HSAaCLcPGWltiZGvTj9gSBIMCboB7950t4dM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v23yl1XRlI6/R87v8YLz/T+/j8Q6Psx2F9P+y+YgX4E=; b=U7M2DW9uOky2Cr3rHy6SteV6Mw
 d1PZhOb6V+n64uikbk/3OtL5xFQ4c7+do2BfMVW9iyPLggfdi27G+msMCPUMumE9uI7wg5ZwjjB0h
 sxXt1eLqGFDzycNBYJYdi59b1Aa0p3k5e3H98KlSAigXSZBoTUYtiG4ndyhY9Qf9AgJo=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdylT-0004x6-0r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:45:59 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43246af170aso1361878f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jan 2026 14:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767912347; x=1768517147; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v23yl1XRlI6/R87v8YLz/T+/j8Q6Psx2F9P+y+YgX4E=;
 b=VFt/NZ8FT0Z9e/DV/4kZ6ytD4jS782JHwzPLAfhIjzGh+NVGluTaEoKJqHHDJlFt0u
 IogyRhBinwAAsgW8ohUC4Ihjlz67ho63ddHYJ+LulyF9I26zcK79Z2cwhuArCmLlxRMw
 kxpXPyeIuRrb29ldn1fMh4OaSUrNwFD4OgtWjuPp80XKRDtWnQVvCZ2inviUv+SCS7TJ
 /KYGmyqP/3em9WqnUJ15p86CSO87I/Qc8bmQWqjAkNBDE2fxps/3TefIdnLC2jVGSTI3
 Yg+kC/3ydGmRLJShHI7PsURYhj3jKxn51cVzoufXaY8RAlQTgeM0gXUoHPBR7YaNhoj4
 vfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767912347; x=1768517147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v23yl1XRlI6/R87v8YLz/T+/j8Q6Psx2F9P+y+YgX4E=;
 b=xHEiF3K12PTLWsoH1/YVYrNU/g03zvOBhFhtrhaGkDTJnX8cMCtRsgyoByFM3uh9pF
 65PdWTtezbsCbVMeAkmNiB7t+P+hvkAm6xZNhv9qZwWe177w5SdmzY8Mz238oqUNcbkJ
 EIcqlnxUZ4s2QVIscsy5Y+f2DYBha7hjP4lNB45/K1wAQFR5gGP9Ozb+gK+1G74qTnuQ
 SkqCgZGiruvAwFXXdgsodZ3wqYlBsPz6fwBjKqFnAYvPQ0zMZ32YOc7Etv+ojax755ze
 YLY6MPaLpP5kP2bnnEv36tq9VFmVA9wMobO0Su6jQYCJhWKzLic7aIWbKPzLj4avCSJ7
 C4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT8scz/Cw5k3ZTB7GivbzPNWMioeE9qd7mx6gWdZ2q6Dmp1FnvpKgpkzlDce6VPLctkHPU1rtKD99LZqkTsl1j@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzozvFqHn1WyKd8YcE6DxOmc6QQ6s7JnmxFqEJq9mMxq1h4NUXB
 yCiDHwxtoR56BZvAsrAwClKphBb6Cl/jHu7bRGxnwnwDxzUphfvUh8Uq
X-Gm-Gg: AY/fxX7uyQzrcN/I5Mro0OAEZqdMlyxJz40W6o6IowLnSkefzktHTuu79wTH8WQpzpx
 ahbj7oz9nmX3UnMApvIwic3KcSZWanW8/Vg0xeIOn42fp9whyHs6KLH0vCJQ7kSXV+ZGCldSm4Z
 SFe9+Yyfj/rSsYDGHhfIEvs4HFHC/1eXJmjSLJdWZ02C6iHpZvGScvGKj71dFHGqmGUn+L45GnD
 v0rcGoMw4FxAws4d9NxoP6Tlf7U98B0M7hS2ekQ9tn+l5ho52vlfS6THyLIPaIB09cpMo32S15e
 C+ZVi+VnKBFHwRdqR5yjN7S+k73i7XDvuKG6MiNKz2b0NVpINUD2sFCGYlsBeXzMykP/XjxgHI/
 hbQWdTB58lTfTmP4wbFFVyn/piPojHq+rYLfp/UJNqMWSmXxJgqqvUj4WJLFuwdDMOqXS0YAiKE
 WPb7teE1ctuXvHi3QYVyonKUhgzmiToqfy03g/t0YzcbL6o+X3HDQi9WZ1Bf3oSqA=
X-Google-Smtp-Source: AGHT+IGzFAB0n5LQiK0CFjp1orx3tC0NUiWOiG2YR2Jt4DpVnrQci46VmyZg1tmpEXWeo4MR0y4q9A==
X-Received: by 2002:a05:6000:40dc:b0:431:2ff:128f with SMTP id
 ffacd0b85a97d-432c362c199mr10613660f8f.6.1767912347243; 
 Thu, 08 Jan 2026 14:45:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff319sm19030056f8f.43.2026.01.08.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 14:45:46 -0800 (PST)
Date: Thu, 8 Jan 2026 22:45:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20260108224545.3019a411@pumpkin>
In-Reply-To: <20260107214231.24163-1-chao@kernel.org>
References: <20260107214231.24163-1-chao@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 8 Jan 2026 05:42:31 +0800 Chao Yu wrote: > In error
 path of f2fs_read_data_large_folio(), if bio is valid, it > may submit bio
 twice, fix it. That isn't the only bug at the bottom of that function. I
 think I've unravelled the strange loops on the copy in linux-next. The 'goto
 got_it' could be a normal conditional. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [david.laight.linux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.44 listed in wl.mailspike.net]
X-Headers-End: 1vdylT-0004x6-0r
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path handling in
 f2fs_read_data_large_folio()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu,  8 Jan 2026 05:42:31 +0800
Chao Yu <chao@kernel.org> wrote:

> In error path of f2fs_read_data_large_folio(), if bio is valid, it
> may submit bio twice, fix it.

That isn't the only bug at the bottom of that function.
I think I've unravelled the strange loops on the copy in linux-next.
The 'goto got_it' could be a normal conditional.

The top has:
	if (rac)
		folio = readahead_folio(rac);
next_folio:
	if (!folio)
		goto out:
which means you can 'goto out' before setting up a pending 'bio'.

I'm sure that could be made a proper loop - although it would cost an indentation.
Would certainly be better with only one call to readahead_foilio(), perhaps:
next_folio:
	if (rac) {
		folio = readahead_folio(rac);
		if (!folio)
			goto out:
	}
with just:
	if (rac)
		goto next_folio;
at the bottom. 


> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index cabaeeb436bd..386d9adfd4bd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2568,17 +2568,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		folio_unlock(folio);
>  		return ret;
>  	}
> -
> +out:
> +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>  	if (ret) {
> -		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> -
>  		/* Wait bios and clear uptodate. */
>  		folio_lock(folio);

If I've read the code correctly the 'bio' can contain transfers for a
previous folio(s), and might have transfers for this folio, but might not.
So relocking the folio may just deadlock.
(I've not found the unlock at the end of transfer...)
Quite which 'bio' need the flag changed is another question.

	David

>  		folio_clear_uptodate(folio);
>  		folio_unlock(folio);
>  	}
> -out:
> -	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>  	return ret;
>  }
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
