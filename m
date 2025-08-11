Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344EB2080E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 13:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLuTO427lyAY2Ux7Etd3D8lXLVscjUAad2ZeRqPZpBg=; b=MENXmvNf2i0BZfXhi0mamHDm4r
	9RQfMJjZaZw0+utQD7Y8p0iNIfAUCJ82UyeOilvcClHlzNIUkwQ9UjHIodi4l9/c5IBsCwurVH15y
	GXkt9cHyRMA/BFHt7KCmFLv5h3N6Y6Ij5o6wYk/pIhkb5MtOXcFERpkGRomehDxBFNJ4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQtr-00051F-0w;
	Mon, 11 Aug 2025 11:41:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1ulQsy-0004xy-NK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CsfvfTNQ5n6/biHEmAYqGCz0oeiqasJwIItIpc+iiCo=; b=ftQy0CJLjhua0VJ3eeVFwv4j4+
 ej1c1M7t7r7Zl5ckbg2VSKeZUYhRMh87Cn4eF/1AQwZXaRonPXSPC2eeF7md5UZA1XNaSE072oo9N
 NL5UNDLO1J9pXc/otYR/pPjQQgJFb1XIJYUj5Ck0z/Zu7U81jO/Jf/xggmG+loE3C1xA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CsfvfTNQ5n6/biHEmAYqGCz0oeiqasJwIItIpc+iiCo=; b=LQZeD+DC9QvT0E9uEeDhHcQ6W/
 ZJTsua9Vnt245/d/xlb0ZZ+DMrecY9CKpj0zEnX5TzMHelLA/vw1eG5fzEutDdnZ6SApciHkpl9z7
 szjM1FKSbIHDbbGWk5/ZEDbHWYu1TF7626Bybb+xHp9PkRX6HN8ununQn7M3LZsX4fKc=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulQsz-0007Cg-42 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:40:17 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-76bdc73f363so3631114b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Aug 2025 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754912406; x=1755517206; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CsfvfTNQ5n6/biHEmAYqGCz0oeiqasJwIItIpc+iiCo=;
 b=hvQVRTHDiXTsf5blPmyygFEq+v2X0nL1nmVR9bu4T9PCz9dJq+6GrcWizF5s/mH3iD
 91061YLV7Xfo4mL4nJ7FD3agoKNZFdvd0cwUoFIxTA+sGDK+JY6dcN4wLq4vDZUmXDwy
 WMYD6JZ9EhGEuiaepwO6c3KCj6CouKGXyvOLK7SJPC2W9XGJ8TNcBQs3QKPeVBrctaaF
 ylPypB7IB58JP6E6OAYWGBi/9BM32YcFtOJ9rY4kTA1lU2w4YaHOV8qZ+64J8GXnz0eR
 qoLc6tEhZDb3U7WbYj8fpmrX9hZrMRFytCChu7HtIV8ZCQqH52T48V1/mwRHhyr4/fC7
 ekDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754912406; x=1755517206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CsfvfTNQ5n6/biHEmAYqGCz0oeiqasJwIItIpc+iiCo=;
 b=gmtVT4muhYXaaAg/FYdOlDo5I+jGLNEh5soG7YV3FcxJRdNzmzqbTbypMZ4eiixarv
 9oAF/0ecN1HoVFb7cvEw+0lGeRbY97HYJhQTOgTRk0FlTbGwj940up/NQfiid+owD2bb
 gq0eIgP4mEaxkt+lKc2Ux79lq7ZyNlWMnYqAtOzkFE4rACLsR4/XbopjtvpbnpsAndZO
 /SnEdAWvNwIh9IBrC+dQLI5FoTNkFr689criaZeH/K9GkRLEk4avHtMVjr2iMJ/bQGsL
 rA8yTDfcLCb9g3IQGJs749KOR5lMDloaw8Q/cSaiGNFWkDafWgqZJKOB94+9jBdeXRaL
 HhZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsnNa5AUluQ8R3cxRaE+wAXQdUs9eB3rTFt4zhDBpUzzw3jp9lnBg+5VrrKAAAvfGFgUe+lW9qr6f9H6uqdOOY@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyx8Ee9NUOqs7hlV9272kEM0ZD+qvNhpDMc3Q10ajwhX92UQbez
 B1kdF9tPDunwsajnMu4JRurLukRN+jt6XRuP6G/+RN0rrLJPbRzm2K6K
X-Gm-Gg: ASbGncveaoTHl8VGTAmSQU1RSDUMzi3JdZYOjUnM+9Xo1+LGr/jjWcDgv2kWprkpocM
 op1O7nBBGIzvggpUChE5blGSLLKMxuMLKb7NC8wN/1lXfiFxty+lGl9u0E0SkfY/6xEC5nZ7Dvm
 hAozXDt9xGsgvS/25UktsNHo1g3Rf/NOgfgRoicTQPCSj8OnjZwrbZ/obHxzf3rh/pCvIN2nNM3
 BsRyeUml+nF7tjcSuQSQyHY0mgYmZTnnB9cQ6/6sJ6UN7VkrL0BMA6xO4OJKQFaF35rIMEnG6Lw
 sW1mKLmG6zaUNnzHtrzuNNtOCaHiSpC6XDzA5ws/+cORf6QUhlMDb7CkhBnj4W+362WaUFqyS2J
 nV4h1o5WKFKIte6MKn+0xH7N70AtvzdN2pQ==
X-Google-Smtp-Source: AGHT+IEwJ2+erliB2nHyfDuFdY2+K5lq8KgtEXMjG7zlgOaxTdlcworvrpqEM5CXW650HNrBglTdEw==
X-Received: by 2002:a17:903:182:b0:234:8ec1:4af6 with SMTP id
 d9443c01a7336-242c226b967mr157922125ad.45.1754912404889; 
 Mon, 11 Aug 2025 04:40:04 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0e9bdsm270132585ad.53.2025.08.11.04.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:40:04 -0700 (PDT)
Message-ID: <7337b81c-3c94-4e61-ac95-3cf700baa30d@gmail.com>
Date: Mon, 11 Aug 2025 19:39:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250811094705.1054251-1-chao@kernel.org>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20250811094705.1054251-1-chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/11/25 17:47,
 Chao Yu via Linux-f2fs-devel wrote: > Support
 to inject .i_xattr_nid on inode node. > > Cc: Sheng Yong > Signed-off-by:
 Chao Yu It looks good to me. Thanks! Reviewed-by: Sheng Yong 
 Content analysis details:   (0.1 points, 5.0 required)
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
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ulQsz-0007Cg-42
Subject: Re: [f2fs-dev] [PATCH] inject.f2fs: support inject inode.i_xattr_nid
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/11/25 17:47, Chao Yu via Linux-f2fs-devel wrote:
> Support to inject .i_xattr_nid on inode node.
> 
> Cc: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

It looks good to me. Thanks!

Reviewed-by: Sheng Yong <shengyong1@xiaomi.com>

> ---
>   fsck/inject.c     | 5 +++++
>   man/inject.f2fs.8 | 3 +++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index bd6ab84..b291d9d 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -192,6 +192,7 @@ static void inject_node_usage(void)
>   	MSG(0, "  i_links: inject inode i_links\n");
>   	MSG(0, "  i_size: inject inode i_size\n");
>   	MSG(0, "  i_blocks: inject inode i_blocks\n");
> +	MSG(0, "  i_xattr_nid: inject inode i_xattr_nid\n");
>   	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
>   	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
>   	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
> @@ -794,6 +795,10 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
>   		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
>   		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
>   		inode->i_blocks = cpu_to_le64((u64)opt->val);
> +	} else if (!strcmp(opt->mb, "i_xattr_nid")) {
> +		MSG(0, "Info: inject inode i_xattr_nid of nid %u: %u -> %u\n",
> +		    opt->nid, le32_to_cpu(inode->i_xattr_nid), (u32)opt->val);
> +		inode->i_xattr_nid = cpu_to_le32((u32)opt->val);
>   	} else if (!strcmp(opt->mb, "i_extra_isize")) {
>   		/* do not care if F2FS_EXTRA_ATTR is enabled */
>   		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 01d58ef..65ac658 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
> @@ -170,6 +170,9 @@ inode i_size.
>   .BI i_blocks
>   inode i_blocks.
>   .TP
> +.BI i_xattr_nid
> +inode i_xattr_nid.
> +.TP
>   .BI i_extra_isize
>   inode i_extra_isize.
>   .TP



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
