Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF29E0C18
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 20:29:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIC6G-0006pN-Ad;
	Mon, 02 Dec 2024 19:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tIC6E-0006pG-FJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 19:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bWFseO7m4ELWbMwwQF3QN9/V027VxEt3vnqTyrKXYoM=; b=JFWPBpDuBfyseQ1HwB4RxwUHFL
 P8uFGw0bWNqI6YM9IXNvgOMn4qhX0XBJcSOqv5IZvvPlwgaJz70ygI9gudckUmA4YiaAHqOuDtqUs
 VuYAfDWvleLsKKdD44kUZBOzyHh9new1TLGmSpaJa5Xivj630WKQZV3ihmMutd5e2pkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bWFseO7m4ELWbMwwQF3QN9/V027VxEt3vnqTyrKXYoM=; b=RjQwTV7wf1vwwW6sSWWRThI/IZ
 VsyJkbobSG+ja7JnvHTY1iuPUVUthEmjdDXR1Xy9qPvuaDgzEEQSYROPmXxuJhiblB4+0vLl9u+tD
 WhMMZk4IY7SkK9IQxvuCZh0sLtlK18zGYGiq5M8viWLpI01sNwV8daWd+to0X0AZExcI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIC6D-0008KW-JK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 19:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733167723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWFseO7m4ELWbMwwQF3QN9/V027VxEt3vnqTyrKXYoM=;
 b=fJ6Hfbz2o0w9aIE1KX4T2ZvO/Rl52hnfCANUuISJz4lXch0AB012lYsTFzV+Lf0WAyWipx
 fJf1Ykfyyag6Yl4M3gGe6RJuAgubFr94706h3pObaCGHmu+1Le7zoD9Tx5Fpr9XOejPadX
 En7JFQAh3vuimHau0ZXbmHox/KIsGSM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-nNTEdUl8Ozyr4VZbZlO24Q-1; Mon, 02 Dec 2024 14:28:40 -0500
X-MC-Unique: nNTEdUl8Ozyr4VZbZlO24Q-1
X-Mimecast-MFC-AGG-ID: nNTEdUl8Ozyr4VZbZlO24Q
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-215b45a6e2aso3033895ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2024 11:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733167720; x=1733772520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWFseO7m4ELWbMwwQF3QN9/V027VxEt3vnqTyrKXYoM=;
 b=mSN0W3nhWwFtCmSfhNV2tBBxOmZ1GeN5TW5zyoM/hT9kIckA1Ps0jAnVKsDzJsNIKv
 4OmztqFBVJCIfQqxOjRrFiBT0M2bEl0Zh0Um9P+d0wC/etfa/UgEls8Le8mV8qp3ahL/
 /L++G0T8bzvX8T7vy7oquF08jM06jldPkMvXH8bsVHnK3g2aF6TeVtye83JfO8fEAIf4
 mNx6mGiJk04dNaJJxWKgcPVbkFthnh7W+EUCdZ3CgdRSlxvqpIniu5EJZ4325VrB0hN1
 bkKYnqWDmG7JkZiqS6zEyzNo4fFELiH3noBSlHHAceTVeET1Pzt8Q60O1QsEp5+whmmy
 lo2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4mnVvh87TawXlXUp87BMMOV4ryT5vcGbN2TefTbuesVtGoj+Mm0+JnveNe3e3hf90SZ7eteXTo8kTy4yOHi87@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwwMDVPkNh8waTjCChyI85is/5w1BKQvY/HpkLMHuidmh3Vfn4F
 qZbHyyxyXZ015C3+k0DK2jjfGyeRLksGJMiNvMdGxr0g7YOeLqsiSIbDeiWlRqGYE3bnf52tQfH
 shnflTiacOV9jY9XZGwf8ufsmdahQ2weMvBtcyABoZwmA2h+29KNEy0+CKMqsN9BSfeb6RRK+Ck
 w=
X-Gm-Gg: ASbGncs2IGMOBvcdKqO34LBwun9Y4W9ad+RmXBluAPOfQkwfDIEjY71m22rbHzBonl7
 gPEpz2ojo3gUkBC4q4igvaB+cJlFkdou+mReQ7wXvl5GSznFm9mkpJARWAMeVRWcHXaWk/+wj8o
 MtFO9WUCXphNkClKDv3toX5NYqt+DXXQsI+iS+vQNaDsPWeX3MV02dDCcVGWkuiKcuDgUx6nwkS
 aXa6Ev4Yw/+QFXgyJgHFsgxjVW0KXcig0b9rPBZIlzJkpaDSu4bnSViNzDYqwWyeKXnbkiLLz+d
 dmlIgNgUr2iiyNc=
X-Received: by 2002:a17:902:f60f:b0:215:30d1:36f7 with SMTP id
 d9443c01a7336-21530d13a51mr267121055ad.44.1733167719869; 
 Mon, 02 Dec 2024 11:28:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK2PWyR5izKn7DroMfkC2QjzimoUXMUUI84ZLwYBgzYg3xki1hiD7a+h4DUk2el7rGPxsNhw==
X-Received: by 2002:a17:902:f60f:b0:215:30d1:36f7 with SMTP id
 d9443c01a7336-21530d13a51mr267120775ad.44.1733167719566; 
 Mon, 02 Dec 2024 11:28:39 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21586d580a9sm28257345ad.277.2024.12.02.11.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 11:28:39 -0800 (PST)
Date: Tue, 3 Dec 2024 03:28:35 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241202192835.seditdylbigpxte5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241202114149.2666-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202114149.2666-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tsCdWDkr9mdzs5g8wFInRxb1hLKeqNFGiICu93gbNUE_1733167720
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 02, 2024 at 07:41:47PM +0800, Chao Yu wrote: >
 The bug related to this regression testcase has been fixed by commit >
 d5c367ef8287
 ("f2fs: fix f2fs_bug_on when uninstalling filesystem call [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIC6D-0008KW-JK
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs/005: update commit id in
 _fixed_by_kernel_commit line
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 02, 2024 at 07:41:47PM +0800, Chao Yu wrote:
> The bug related to this regression testcase has been fixed by commit
> d5c367ef8287 ("f2fs: fix f2fs_bug_on when uninstalling filesystem call
> f2fs_evict_inode."), let's update commit id in _fixed_by_kernel_commit
> line.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/005 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/f2fs/005 b/tests/f2fs/005
> index a817d51a..33d4fdb9 100755
> --- a/tests/f2fs/005
> +++ b/tests/f2fs/005
> @@ -11,7 +11,7 @@
>  . ./common/preamble
>  _begin_fstest auto quick
>  
> -_fixed_by_kernel_commit xxxxxxxxxxxx \
> +_fixed_by_kernel_commit d5c367ef8287 \
>  	"f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode."

I think we don't need to use 3 patches. As you just add missed commit id number,
just merge them into one and named "f2fs: add commit id to _fixed_by_kernel_commit".
Or if you hope I can do that when I merge it, feel free to tell me :)

Others look good to me, with above change:

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  
>  _require_scratch
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
