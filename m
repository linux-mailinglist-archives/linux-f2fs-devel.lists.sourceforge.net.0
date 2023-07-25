Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23276069E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 05:28:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qO8im-0003Rx-4N;
	Tue, 25 Jul 2023 03:28:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qO8ik-0003Rr-JP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=; b=Fq9tX3DALlEf+eDQF9SqKrAFc5
 PGl5B4sPZlP3d3y3WuWAW+S9mPE6htVpAR6uvk+7lZXc++epSp1Mb3X8iXYYwuCR2ZmeF4Ce5Myrg
 58mpQNne58XtDaC7sXm8obEy9iocsqC8XpN/8jH6d+FQLqxmhtw/XXQVBb6HLNrr8AU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=; b=CPyL//H7SBLkKy+IlqpHBaJk3R
 0TuDev7QnS8xNQPaKKaVPMyNXpY3GucscO71/wYRwNEox+fMNhqkr1mzk3v4dmzVpUtp/EM1u9mUw
 xNV+7BPUNRN6Hgx/HDPx6lmZghDIQsmeuCKgelGqrUSyexJbF07eZbPVc7N72F9BJUHY=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qO8ih-0001nG-7R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:28:22 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1181691b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690255690; x=1690860490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
 b=PknHptOa2Z8+2vaclzexjcjHcgGTKnQ0JRJ89LK+GvkJZyUzNmFYDaw4LaxhrbAB97
 Qlt49eA21cgLfip1YkLzQvNHl9NRE1uu+H3yLMzr5GUQw2R94ASja3LKRc7K2/IuJ877
 /rUQws3HOX4h/pSV0QLIC/txctttQBZDy4goWlpNGxYwzk8J6CttdGDNpskz9IiWFE6E
 W06R7YBvAlwN2Ll/k0WZ+e8J2UJKgy2rlagtK3lUaqPgpyCrwLsDTNoP/0MXBrAUaLK4
 fe8VXE6m3BmotnBeZ7KmASyzpGnPX5FsNzpJdMUNn5TjD0dfcmx5lygJuqraNOT+sjor
 yB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690255690; x=1690860490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
 b=TWjGqE0dugY6tNk+CzxrjAdQjvc6M/YWEArgcJF7HK0yExSUd1tGrxLVgbOf5Ok4xh
 4jPIaQda0LyZK7mh0bVcJrNHR9HOy38NXZZnM6FBGRmX3Z0qJYIW83PZ8A73/Hc63TWL
 ES85OLDBG9A2s+571YVqlES+vbmFXq19DS6zEngBKsWrrzRuBmmVqHPpgAT1TjToZSSu
 6EfoaFORv0PmoUJODcK0PEACtBAPksaq+sxjceX5V9WFeN/tDQ0HJjpzfK0ixzXRYbjA
 xwogfUZr1doBDDYjHAB67TdYQmAW6BrXUhTW6H4mWUkhq+FmdHAdFOTa9Etb1vQICyGR
 ck1w==
X-Gm-Message-State: ABy/qLZt46VzCbbxaVPNfoveEL41pBPz/1VguGmn/wzbUdIXT5rNBH2k
 3x8cmhVjPWCF3BJjadL9cN42tQ==
X-Google-Smtp-Source: APBJJlHvnzRChS6v/nee9rDGEWxm9C29UVXVwYKOSH3HP5ue/guAsHAKmcdiSeukVqd30tCkGAz2cw==
X-Received: by 2002:a05:6a00:cd1:b0:677:bb4c:c321 with SMTP id
 b17-20020a056a000cd100b00677bb4cc321mr15272930pfv.0.1690255690395; 
 Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 s3-20020aa78283000000b00682a9325ffcsm8407714pfm.5.2023.07.24.20.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
Message-ID: <bbd36d96-b6b8-08c3-1092-e3d0b255134a@bytedance.com>
Date: Tue, 25 Jul 2023 11:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
 <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
In-Reply-To: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/25 11:23, Muchun Song wrote: > > >> On Jul 25, 2023,
 at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote: >> >> >> >> On 2023/7/25
 10:35, Muchun Song wrote: >>>> On Jul 24, 2023, at 17:43, [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qO8ih-0001nG-7R
Subject: Re: [f2fs-dev] [PATCH v2 01/47] mm: vmscan: move shrinker-related
 code into a separate file
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/7/25 11:23, Muchun Song wrote:
> 
> 
>> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2023/7/25 10:35, Muchun Song wrote:
>>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>>
>>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>>> code from it into a separate file. No functional changes.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>> include/linux/shrinker.h |   3 +
>>>> mm/Makefile              |   4 +-
>>>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>>>> mm/vmscan.c              | 701 --------------------------------------
>>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>>> create mode 100644 mm/shrinker.c
>>>>
>>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>>> index 224293b2dd06..961cb84e51f5 100644
>>>> --- a/include/linux/shrinker.h
>>>> +++ b/include/linux/shrinker.h
>>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>>   */
>>>> #define SHRINKER_NONSLAB (1 << 3)
>>>>
>>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>>> +    int priority);
>>> A good cleanup, vmscan.c is so huge.
>>> I'd like to introduce a new header in mm/ directory and contains those
>>> declarations of functions (like this and other debug function in
>>> shrinker_debug.c) since they are used internally across mm.
>>
>> How about putting them in the mm/internal.h file?
> 
> Either is fine to me.

OK, will do in the next version.

> 
>>
>>> Thanks.
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
