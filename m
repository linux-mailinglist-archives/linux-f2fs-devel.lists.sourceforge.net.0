Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D47AAD272
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 02:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjyKnJaXI3hZ4084RIC+cFP0QL7foyeUDqpnvIF7eiE=; b=N+G/Az7NtB1FCfK66kvIaLK9rc
	qgPrR08EinsaNKTCUAT3hRswdkHuoWBjkm16JyU/zsWk4zuXoNNwOlvZ57DdnQOLBFRdT3Qj2U1PO
	VTrgaLfr+CQeH1wE+P7LIQ1x6Y7xQsCcUwicGFH/QLs6gFTkythniqWA+dnjhh1lXMIs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCT0t-0002SH-7F;
	Wed, 07 May 2025 00:51:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCT0r-0002S9-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pWr2cd+by9UmAmsp9hYIXDpK4lbQf5sBIt9vQ+uU8Y=; b=lo0+zCAmIISiNuuuztaPnMW/uH
 8qYxchVsp2QGGGBBwk+qy58tUr6UItsPn6o6MX4bBOcrvgv7Lzcd0r8IZp8fN4yyCsCxKCsLdqdrU
 7+bQqVpk6cJ0BiviMlMT5XSyv/VlpgMjEX3ca2fTp6l51sYK8v/YP45ta3yxdA9MwbQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pWr2cd+by9UmAmsp9hYIXDpK4lbQf5sBIt9vQ+uU8Y=; b=BsB84x4MTV/etYBkEiLj2mOcD6
 2jIeEXX5Zcccq0lwKBy1TE9OMitGsuZl4x0LlYx5+o5Yl+wa38u+kDpM8PLmisJnKQem/ljNR2O0Q
 AKoyLe9PdxauVuS7zgti53dH11QnisQt9pZkKSzPvV53P9fdXzEN5AidUpnmIfeEDpMo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCT0a-0003EV-6q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746579085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pWr2cd+by9UmAmsp9hYIXDpK4lbQf5sBIt9vQ+uU8Y=;
 b=aQti/dPOftnButD+ZFM8D3Dt9BxLKe+Kfe43j1PTok9+thQ/ejVj4ct41LtmpKJQhJECzm
 TuI6szC0L4acOhuyyCMgP06XDQMaGKBBILxaiSk+RhcNSd9RLRpNZMM8WVnsqntOe9V7jS
 uoqtiydXAgjNU+F2Aaoi6Uv2v1Q1wtA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-mLCWfLIqO_-dp5XpZm1_Ww-1; Tue, 06 May 2025 20:51:21 -0400
X-MC-Unique: mLCWfLIqO_-dp5XpZm1_Ww-1
X-Mimecast-MFC-AGG-ID: mLCWfLIqO_-dp5XpZm1_Ww_1746579081
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3d970d75b64so74323075ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 17:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746579081; x=1747183881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0pWr2cd+by9UmAmsp9hYIXDpK4lbQf5sBIt9vQ+uU8Y=;
 b=LfNsvFzKZkVKafwuYEkReSCizrV86tGOm+usjh4hQsyJXHy0xPjOhv4RuolEZ563bt
 n8rjtC18NCVrF2UhkaGFAl64mjVPA9xxc7HDyJyGhcshfthycnxRpoBeje+DmuFnaZwD
 Td7Uk7gdcafjvItwRPZAgO+7yj159KtqobjteH+ukgKkkYRyPQ8czdKf+msCm1wLomlk
 o92jojvXy4EFT3RMmLA/kt26b1Vbe8Ejsvl6od2o0PfdmKVQM4V4gtY1obl0UdCxaLNQ
 rmEI4ynI1xP13ckQHBwSLdCPTtEcR5UNLjLzVhvuL+zGcdfyKpPD9F51Eupf9zTJHxlj
 WWvg==
X-Gm-Message-State: AOJu0Yx5w/IlyeLfoa/o3JY5totGv3eEzPOPiaG0zn9Q0bBUvYZ7gswX
 0lcn9UhEj9WwOXgBSvmxSemJLsIRkjk3qxboefZPYY6f0CazHLDxpflRV1s3Gw7+1uFICG9FdTQ
 l3SmXkAnaiox0USRYRJDzagLR9OoMqktEElh1MMR/l3Xdmmygw1NU1SzSzYgsUPsRvexnh8kAC+
 s=
X-Gm-Gg: ASbGncvT2AulmQgqyUO1WY+1gT0kjiE6m47tDelRWEJaxxZWEpvD/tRnB2l7xERuI7a
 gPxTc/0IizSvmxUq4RqBJhhaHF450Ebph7Ny6ZHebVUSF5Q+Qj0ZwwhUe9fmk2kPDC3BmBQnTYV
 NSVMV0hRUB0oq7cTIPBlL3RnGvIhp4r6YYvMy+VOyETgwMFABxExnkhk+XrpMHd4TTUwlRuPXqx
 xcf/l6QzDzUKSUj1y8+NMZRLgEWhp9VwWRT8YygMz2Ra3IyKuaZfXLwrKEM0tIk7BRksAiRA8wm
 E7fSWR803Sc2y6ZZDtlRMIDRFRD+nLP6F69XDUOiO/qu/jg9fw==
X-Received: by 2002:a05:6e02:1aae:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da738f0d85mr12512885ab.11.1746579081117; 
 Tue, 06 May 2025 17:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ0VOD9u4tL6JybdUb0h9a596TAGo0eVzlgDRptJuHaa/SZEu6MEmjYCHo+4LemHqTUy4pLQ==
X-Received: by 2002:a05:6e02:1aae:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da738f0d85mr12512745ab.11.1746579080702; 
 Tue, 06 May 2025 17:51:20 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3da7306f4a5sm2549905ab.49.2025.05.06.17.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 17:51:20 -0700 (PDT)
Message-ID: <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
Date: Tue, 6 May 2025 19:51:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
In-Reply-To: <aBqq1fQd1YcMAJL6@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KgAQm9kCzXn_dcyRb9jj9y7kiPBKEaF0mH27JAJYhPE_1746579081
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/25 7:35 PM, Jaegeuk Kim wrote: > Hmm, I had to drop
 the series at the moment, since it seems needing more > work to deal with
 default_options(), which breaks my device setup. > For example, set [...]
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCT0a-0003EV-6q
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/6/25 7:35 PM, Jaegeuk Kim wrote:
> Hmm, I had to drop the series at the moment, since it seems needing more
> work to deal with default_options(), which breaks my device setup.
> For example, set_opt(sbi, READ_EXTENT_CACHE) in default_options is not propagating
> to the below logics. In this case, do we need ctx_set_opt() if user doesn't set?

Hm, can you describe the test or environment that fails for you?
(I'm afraid that I may not have all the right hardware to test everything,
so may have missed some cases)

However, from a quick test here, a loopback mount of an f2fs image file does
set extent_cache properly, so maybe I don't understand the problem:

# mount -o loop f2fsfile.img mnt
# mount | grep -o extent_cache
extent_cache
#

I'm happy to try to look into it though. Maybe you can put the patches
back on a temporary branch for me to pull and test?

Thanks,
- Eric




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
