Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65908D2350F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 09:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLu/s7UPUSDKC1maT4mM7yRslOVAhrb9pqJtKdW/k8o=; b=jM9RaWb9D6qgVLIV5RT/xX1w6C
	p6Ext6fK4DaVSvjcSmXU3v9mB7cyEYFsdUejAlw9fE9gurJu1A2BV8YAoAMMjGNiFFyCiA+JAPzp0
	4szRV13ow+d7TGbYQUEC2Z6bp86b36Wu78bfrWohiUTWMK1LC4OvBbDFLW51C0uXAvrg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgJC9-00060x-Eb;
	Thu, 15 Jan 2026 08:59:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hirofumi@parknet.co.jp>) id 1vgJC7-00060o-4Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 08:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=239oZ275b6smCS74K1tWdjRS0BNLiePy77vuyzqmFog=; b=R/vXRJaG208miDAinrqnXXux3Z
 n8+oG0FxpfGUN/SRwU1+LIrLZWybIxCJtPgfzylX4+cKz1sLF8GXnGlINypRYgArkl9RHoCASK1Zj
 MFb/LaJU7NUTbfjF9SYavp8YGWJAKWCXjf16oejwqQUyfzMP8k36nVDubezQlZKqyvGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=239oZ275b6smCS74K1tWdjRS0BNLiePy77vuyzqmFog=; b=IfsN16Cz/V6m/Kxh9cAEFTTb1D
 w/EJ7u94voXI3egiuwkQRqym/srxJDIcfh/rW0cRt7BBEIHMh1oZh8AdSyYzchk9Si4HaM4UlP3ln
 IyQrCjDLiPHfCDzaxXit2F696MtdAyJsvzkb88y8dt1ZYLD5XtiuiVNxw1vhRUjHzi9Q=;
Received: from mail.parknet.co.jp ([210.171.160.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgJC5-0001Fd-MF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 08:59:06 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 59948209655C;
 Thu, 15 Jan 2026 17:58:53 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
 s=20250114; t=1768467533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=239oZ275b6smCS74K1tWdjRS0BNLiePy77vuyzqmFog=;
 b=OYfw2Sur1UuFe52+b+QneplE8FQ8rN3ZPZNmHUjXZ8I3EUbVeENQa9S7UE9y2K/+XwV3SQ
 I/ZZv2vblo2O4gCBhhbii9EMgTIhTnJ/l+EBkDsJz7Ar+ySVu32QBZ6Gv6ZPTUT/orvUyF
 1QfiBPAonvwEk/e0naEnhF3vz9jWm+xYwR6FdzXz0RU8n3PI0yjEuiVMmzDnXYu3FOUwsO
 ju7euX7+j6w8JoZ6Ylar2ikJfzTuIaPaPoZvjemwpemy6GSLCFLAZkIp5MRiF8qr7GeUC3
 Po5ictZNHCSisTuUNKKDZ7KlEQmc0+zpktZuVHakaOIbuZMCSLmk2ou/QrzuiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
 s=20250114-ed25519; t=1768467533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=239oZ275b6smCS74K1tWdjRS0BNLiePy77vuyzqmFog=;
 b=ArK7qpn4FSYfiTqDwLBIMwdc8g0BdjAmYQzNjX9MTC6w813MFWfk5weBlFC8Egh9ZmVWC0
 pvksDNyaiFFxs1Dg==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id
 60F8wqQB134411
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 15 Jan 2026 17:58:53 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 60F8wpYn351446
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 15 Jan 2026 17:58:51 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 60F8wnRr351445;
 Thu, 15 Jan 2026 17:58:49 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Chuck Lever <cel@kernel.org>
In-Reply-To: <20260114142900.3945054-3-cel@kernel.org>
References: <20260114142900.3945054-1-cel@kernel.org>
 <20260114142900.3945054-3-cel@kernel.org>
Date: Thu, 15 Jan 2026 17:58:49 +0900
Message-ID: <874ionw8ty.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Chuck Lever <cel@kernel.org> writes: > +int
 fat_fileattr_get(struct
 dentry *dentry, struct file_kattr *fa) > +{ > + struct msdos_sb_info *sbi
 = MSDOS_SB(dentry->d_sb); > + > + /* > + * FAT filesystems are case-insensitive
 by default. MSD [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vgJC5-0001Fd-MF
Subject: Re: [f2fs-dev] [PATCH v4 02/16] fat: Implement fileattr_get for
 case sensitivity
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, linux-nfs@vger.kernel.org,
 ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chuck Lever <cel@kernel.org> writes:

> +int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +	struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
> +
> +	/*
> +	 * FAT filesystems are case-insensitive by default. MSDOS
> +	 * supports a 'nocase' mount option for case-sensitive behavior.
> +	 *
> +	 * VFAT long filename entries preserve case. Without VFAT, only
> +	 * uppercased 8.3 short names are stored.
> +	 */
> +	fa->case_insensitive = !sbi->options.nocase;
> +	fa->case_nonpreserving = !sbi->options.isvfat;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fat_fileattr_get);

Hm, if "nocase" option is specified for msdos, it would be the case
preserving (ignores/breaks the spec though).

I.e. on msdos mount with "nocase" works like the following

    $ touch aAa.txT
    $ ls
    aAa.txT

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
