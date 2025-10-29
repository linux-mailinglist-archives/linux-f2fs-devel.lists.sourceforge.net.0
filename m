Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F50C18DDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 09:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuafcujvRu1yZ5HI0A8/OP4+QMrh34wxTPvGe15O+sE=; b=P9cXMd+cSygbbnjGr4iziWgl4x
	vV3KofbLbGITMcYRnKlic0C8tFDrHSQFfohCC4fSor9M+PWkVu/C4sONmQ5jaq31pAkyCM0ae9K3U
	6bl94V4jCxJM5FyV8muSi4umeIxT3Wu36W2M3accpb7J4B4O5pIdQ9iisiivsB9uLjN0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE1Fq-0002bU-Vj;
	Wed, 29 Oct 2025 08:10:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vE1Fn-0002Zb-Ls
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 08:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LNjuAHfdnVrSLNCRy6xIGgJea4x8vYhKPXV6kMxxL/4=; b=Xu9y85UuWYDZ0XYTGF5JnU7MoH
 j0SJCEnNENDBZTZX4+fpRNkcTKbGVXcf0MJs0ZeQFxWkUl/YwEpAEI9H0941xt5sixWMnrR/NFR6P
 AEZwbx1/cCV+5VZAIfWTWEdI3f3xOWEa+CIknOyTym/js+J20qTLbzZ8ElQ9thAxqsjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LNjuAHfdnVrSLNCRy6xIGgJea4x8vYhKPXV6kMxxL/4=; b=OvTQgu5LnmPoelS+aQ33R8ewjy
 XEgGMD00mNSi/DmZ1FFdEk+sRZmgc0EGoL0DRiO33Fqlox82pdFdTIJMrjHHlanoN+peQs8aBBYuy
 7HGODM+Q2Ip1mpRNVBARKh6pigqEpzK6ZtjzCBfBQGpTKSO+MmDEADmQ8CVMtuWj+3DM=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vE1Fn-0001kb-8M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 08:09:59 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33bc2178d6aso5084981a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761725388; x=1762330188; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LNjuAHfdnVrSLNCRy6xIGgJea4x8vYhKPXV6kMxxL/4=;
 b=RSbcdoasbrdsa5zyxzA+p6uJZH9Wv4WSFEsaMlAsy033qDnFVE58OUHA8dyIPKXuYi
 AC0zSOxfIFKrQCKfXCSUyJHxMxrxKTgB1Jvkk4t/1G5wd2jCilFqZhvv3daCsmemQ2YA
 Gtyq+749C/RxdNnc5uQmOJdLRafTrzgOKd3aU/mYNQP7T+wY7yHAmdHlMm2YmAEc4Mmk
 M9s328SVdqeoCeFHgYf6zhd7mrgg7LzrZxJn80IOROyLPmlNQsTLmiRviA+p5817Hjsl
 VE1FhXkJzoxB3bdSD6CDKMfTt1cmhNdtB3hYMwrYV02CBVH4uGIGF/PZ8Oh19xzLSUrF
 2ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725388; x=1762330188;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNjuAHfdnVrSLNCRy6xIGgJea4x8vYhKPXV6kMxxL/4=;
 b=R9Zvut7p2v7mAyZRZ0gSedmXyddxc3kQksMKlP96Sh9H1AjvoV9fgjNgtS8Ckic5tt
 ja+bMJozdqGHjMXiJ4rcfSxTsmQ4Bm7pEWUn8MCplfaF/3PhFUSNmm3qZdjUTp8JyS+j
 kef22y+/cLxJRD2j5F83SoMH2eTk4VW4KXDgH4wE7sRNJ2Q/YGNfvJix57rGlVq/ijot
 0OZU1McUDPl9FRbPpzP+eiW25xK4T5n12mTvlOCnz4OoyznnCeSeu97NS36jAaftFrCO
 ZuH6BHUPaqKqteD/LzI/f/Nx7jMDvwy2ADS/fDCjfrNSL95LwzwzuIfIzjEuPDnOv7k6
 WmTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYyvEmzE5XBxLn87GdRXJliGtzmEcADux+DlNHN0htf60aOSN7IzJTr7hSovTpwNXaI8iK1l4pCHmilxooe6Yu@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw4/MvkyG+yhYmNZAtss0Uu29Ql6VyYbtH23v+0sQJYY0174EIu
 QW3Y0pK5kqbBHwMjWX2KNgHxrEdnZjCoI8z9VNkUKyAUGeL03crNjy3+
X-Gm-Gg: ASbGnctdhZKlQp4VGWUpaT0M8+qgTiIbA/Ehn78h6ZjnP/LqRgc0LL5vsxqOkDCdxyp
 oRc4ml1OLwKn96rps6hpFUDHpvz0oJ/66ZL6WVfTqU9cH4McwECHcohXmJsqOmnPoXnQzU+Mf3N
 RTJNOOtuAkGZy1yJpcSvC32yYj2qRWk/VZbOhq1bkYKJ/YUxJko2s5ugKqmyXn5Ayw4zNuYRmjf
 mjdMDeHcJe/R3AHvRQlTNtFRnJ0dKgkk1GwEd5boywpvsWhCokWY0XU7l+7jfzba+xr8WilPy8F
 pclI8j1ACcyE2kX59F33G2UQgB8X3UJXPI13Yvjm9jNy/g3H/kRv3roZdqmbPf/klg4OUZX54hT
 rPZQeh1P4oaAZUQJlpQENSmCIUF6By9kd0K7FLe131JUccRxIhhtCCSQ9YvzoI3nA66mp4C7dwS
 wbkD/HHvAYh22tjDRffjc=
X-Google-Smtp-Source: AGHT+IHoaokniGP0kWn4TpMtslZohdgaOiOqzJLjzpjzZxa2pu385BELGmeW9ExGf9YkZ/j/vnWN3w==
X-Received: by 2002:a17:90b:3ec4:b0:33b:d371:1131 with SMTP id
 98e67ed59e1d1-3403a2a455amr2149965a91.34.1761725388367; 
 Wed, 29 Oct 2025 01:09:48 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed7f3aeesm14620399a91.14.2025.10.29.01.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 01:09:48 -0700 (PDT)
Message-ID: <f9cf5992-0357-4702-be73-881c9997929d@gmail.com>
Date: Wed, 29 Oct 2025 16:09:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20251029063105.989253-1-chao@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251029063105.989253-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 14:31, Chao Yu via Linux-f2fs-devel wrote: > It
 recommends to use i_size_{read, write}() to access and update i_size,
 > otherwise, 
 we may get wrong tearing value due to high 32-bits value > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vE1Fn-0001kb-8M
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to access i_size w/ i_size_read()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/25 14:31, Chao Yu via Linux-f2fs-devel wrote:
> It recommends to use i_size_{read,write}() to access and update i_size,
> otherwise, we may get wrong tearing value due to high 32-bits value
> and low 32-bits value of i_size field are not updated atomically in
> 32-bits archicture machine.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   include/trace/events/f2fs.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index edbbd869078f..e1fae78d64a5 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -204,7 +204,7 @@ DECLARE_EVENT_CLASS(f2fs__inode,
>   		__entry->pino	= F2FS_I(inode)->i_pino;
>   		__entry->mode	= inode->i_mode;
>   		__entry->nlink	= inode->i_nlink;
> -		__entry->size	= inode->i_size;
> +		__entry->size	= i_size_read(inode);
>   		__entry->blocks	= inode->i_blocks;
>   		__entry->advise	= F2FS_I(inode)->i_advise;
>   	),
> @@ -353,7 +353,7 @@ TRACE_EVENT(f2fs_unlink_enter,
>   	TP_fast_assign(
>   		__entry->dev	= dir->i_sb->s_dev;
>   		__entry->ino	= dir->i_ino;
> -		__entry->size	= dir->i_size;
> +		__entry->size	= i_size_read(dir);
>   		__entry->blocks	= dir->i_blocks;
>   		__assign_str(name);
>   	),
> @@ -433,7 +433,7 @@ DECLARE_EVENT_CLASS(f2fs__truncate_op,
>   	TP_fast_assign(
>   		__entry->dev	= inode->i_sb->s_dev;
>   		__entry->ino	= inode->i_ino;
> -		__entry->size	= inode->i_size;
> +		__entry->size	= i_size_read(inode);
>   		__entry->blocks	= inode->i_blocks;
>   		__entry->from	= from;
>   	),
> @@ -1006,7 +1006,7 @@ TRACE_EVENT(f2fs_fallocate,
>   		__entry->mode	= mode;
>   		__entry->offset	= offset;
>   		__entry->len	= len;
> -		__entry->size	= inode->i_size;
> +		__entry->size	= i_size_read(inode);
>   		__entry->blocks = inode->i_blocks;
>   		__entry->ret	= ret;
>   	),

inode->i_size usage in fs/f2fs/ also needs to be updated. For example in 
f2fs_need_verity(), which may not protected by inode_lock.

Yongpeng,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
