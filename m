Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B792546B7A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 19:12:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nziBa-0002Yw-BN; Fri, 10 Jun 2022 17:12:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nziBY-0002Yq-3m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 17:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwXtCw17WJllmx5Ao7pJMmgs8rW8H83BvHSWIXWlK/Y=; b=Gdmyvr/+2FQLJj0ENUBw6EN0PI
 o1u3YfQlan2KD9eD4c8OO3MEkUbzSWPPshiBdHGMF4GhddQ9HdUt+xxITL1/mxjoIra11wxI/KZiA
 gq3v42HqeM2n9knLAfJ0Nnmj6bdSdgGQbS+p9t9aGFXKwEGiHgj21uZWnHXbbEcKFHCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kwXtCw17WJllmx5Ao7pJMmgs8rW8H83BvHSWIXWlK/Y=; b=QNbkL/8Uv/S8PdI77SOCPOeiTo
 MMjY7j5PHBnfWOUCODnjt+BQx2iWuZgGyfidT7/5WgdhuWVsHWFZJ6KxGitfytyns5o/CsRb/yQCv
 4UDxQfvL8hDjNCzWwBTIHiD5+veXOEHboM+G3i87TtL7M3wcVPQtbTUoXHCJAHYXsB3Y=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nziBU-0002iM-RT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 17:12:34 +0000
Received: by mail-pg1-f182.google.com with SMTP id e66so25336455pgc.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jun 2022 10:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kwXtCw17WJllmx5Ao7pJMmgs8rW8H83BvHSWIXWlK/Y=;
 b=ILrkXyYXXhYqOrdgQbbpiMYX/DLBGn5imuCut0BS/8xON9pFXtql2E1tbUc1EnO0iv
 mHAHrk/U9U9nGL/KHOgA0ODZWV4g5outzBu8QDF/Gwlz7hM2CrVgzoLDy7leBdXgcjSX
 PbgmBlW2sptjuoxVdE+ZJPbMnTmIT7SFm7lqQcU4zB2E9PheZa78A1Qvyy4WDeo8kzQE
 tARF/5ELtCzBu0HssugthgJV9982YrxX1px6SP6qzmbjR4kC05iGEOV5W+uhc9Bq81pJ
 2eCiTDYBf5xoy5iGk4G9U5ngDUYE23ulxZe6bjx5lVH9VReBQEzaxusRgVwQJqdl08Va
 dDWA==
X-Gm-Message-State: AOAM533ZfLyebpCe5h6Wwknh7CTXoAZbKpNHWdDDsWaMY2c7HwFHQTTf
 yU2p+8QtUwgE6DUverQRrNg=
X-Google-Smtp-Source: ABdhPJymjxEbiUTV+3hjXutmvvnsNgwYdPjJrvjfiZomVNcSlUtbfzD7X6lSGtgK3FGuHOfQhpuVIQ==
X-Received: by 2002:a63:6985:0:b0:3fe:1929:7d6a with SMTP id
 e127-20020a636985000000b003fe19297d6amr16625457pgc.292.1654881148479; 
 Fri, 10 Jun 2022 10:12:28 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9eb7:13f0:a1e0:550e?
 ([2620:15c:211:201:9eb7:13f0:a1e0:550e])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a17090a288200b001e2afd35791sm1998642pjd.18.2022.06.10.10.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 10:12:27 -0700 (PDT)
Message-ID: <2f40b5ea-b493-bcb9-97ad-612d30a2eedc@acm.org>
Date: Fri, 10 Jun 2022 10:12:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Peter Collingbourne <pcc@google.com>
References: <20220421221836.3935616-1-bvanassche@acm.org>
 <20220421221836.3935616-11-bvanassche@acm.org> <YqKm4wa31ygW8+Ra@google.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <YqKm4wa31ygW8+Ra@google.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/9/22 19:05, Peter Collingbourne wrote: > On Thu, Apr
 21, 2022 at 03:18:15PM -0700,
 Bart Van Assche wrote: >> +static_assert(sizeof(struct
 f2fs_dentry_block) == 4096, ""); > > I noticed that this [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nziBU-0002iM-RT
Subject: Re: [f2fs-dev] [PATCH 10/31] Verify structure sizes at compile time
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/9/22 19:05, Peter Collingbourne wrote:
> On Thu, Apr 21, 2022 at 03:18:15PM -0700, Bart Van Assche wrote:
>> +static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");
> 
> I noticed that this static_assert fails when PAGE_SIZE is defined to
> a value other than 4096.
> 
> I have to admit to being unfamiliar with f2fs. Is this an on-disk
> data structure? If so, does it mean that non-4K page size kernels
> are unable to mount f2fs file systems if the f2fs-tools were not
> built with a matching PAGE_SIZE define?
> 
> In any event, maybe s/4096/PAGE_SIZE/g above is the correct fix
> for now?

Hi Peter,

How this issue should be fixed depends on whether or not 
f2fs_dentry_block is an on-disk data structure. I'm not sure about the 
answer. Jaegeuk, can you help with answering this question?

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
