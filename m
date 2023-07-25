Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAFB76065F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 05:09:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qO8QV-0004je-9B;
	Tue, 25 Jul 2023 03:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qO8QT-0004jY-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=; b=Ib+fi6RxaUMor9ZahgW9Ap3ar9
 UWlYh6i20tcJY9mv/P3r3SQOgx4CdHzPNRvU2GRj162fsHA+ENBTsKWeLc6z2I2Bus2oFUPRkztFy
 7n8/FcOsJB1R+bDvbAiABDyHv8MijDQ1ccHgc7M02Hl8JRc34cFjJ/lqw5U/LY8tTP7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=; b=nJXNqIK9vx0J54LhRmyP8YFvPH
 SdtSCTzv7usVk9ndX4B0OCXkFA22csAqU1QobsQAKzodo2Gj9/+/JseeM5a7nqcxBQVuUUTeJpiFA
 nov20TLoFXLisrClWdMZX8WWcpia+EVlTVcIwPAO7wBe0KpeWWem5mytE8wQYdwxsHCo=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qO8QR-001LpM-OH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:09:29 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-267711d2b43so714276a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 20:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690254562; x=1690859362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
 b=T37460khNMPot0VVWdDz4lB6VWzVdicUBxVfz7CttLqrgD8g0MkXpwdKxm81+5qM3E
 yM+KFmnDFeQa0ZY5ZeNvvyumpxFJqPDg3oixgT5YKKGKOt9qmtbXs6vK0nUKy4kqsaDS
 iJ3utK1jXEfJapBrHYjK+SRbiAPBWHkzR4mO0jKk+qC4Stl39POzbhCCP4MwAtpmSso5
 ynGZ9erR4hLoA8pCdH+sRZpUbw1kMvKh2ycfFI2IzmOqd8Zq8Q0hlgUcK6mejCeashGS
 UzcYSPHM74qvjYTTAriMRhyDbW62IR+NfEc7uD2qj/U2RIYLpDl8fGFG28yoLGatJrqh
 GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690254562; x=1690859362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
 b=jpcYaOR25iqd1Vti7uIShf0ih6/kqdwVYR/LXQgpkT8qJZ8Jnjg+FE8Zu3XugFdcnX
 PtPqL+pPT/2toIgX0JVWV1M8m1cPf4qM3B7XfHCUsRbEUOkY/Ux+HoRDg2E8x0z1LsRw
 8bv8dSiFhQsejPSjYbyPc3T3xYrHun+uEV/Gfu++8XZOA1Oo4X6Kn/exTOoa4MoswH4O
 5gyzYlZRX+TrgXuSFe24WLNKpZ4KPKZWMYnaadwk0CjQNl9hwxLBkOkGl0cuJEZYsIpX
 dIvYAbNxZgwrXtET5QfSAO7wNvWzmq2X80uUsQERKF9r7ilOZkQ9C1sDHokgWVU791e/
 NXtA==
X-Gm-Message-State: ABy/qLZvxS337/jYXcnwZ4oiKE+vzsCVazm2QC6XYkaOdXAGr+oRH8sV
 ZXDXD3v90YZ63dx51JoD77mIaA==
X-Google-Smtp-Source: APBJJlEruF0WFFXXZAOwcLJKfTF/P8Yek4Wx/bwgxp4VRr2IRHJr9OEk7izXq54CPTEEiNehAqKYyg==
X-Received: by 2002:a17:90a:50f:b0:263:730b:f568 with SMTP id
 h15-20020a17090a050f00b00263730bf568mr10246975pjh.3.1690254562043; 
 Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a199500b002633fa95ac2sm9540001pji.13.2023.07.24.20.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:09:21 -0700 (PDT)
Message-ID: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
In-Reply-To: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/25 10:35, Muchun Song wrote: > > >> On Jul 24, 2023,
 at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote: >> >> The mm/vmscan.c
 file is too large, so separate the shrinker-related >> code [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qO8QR-001LpM-OH
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



On 2023/7/25 10:35, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> include/linux/shrinker.h |   3 +
>> mm/Makefile              |   4 +-
>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>> mm/vmscan.c              | 701 --------------------------------------
>> 4 files changed, 712 insertions(+), 703 deletions(-)
>> create mode 100644 mm/shrinker.c
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..961cb84e51f5 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -96,6 +96,9 @@ struct shrinker {
>>   */
>> #define SHRINKER_NONSLAB (1 << 3)
>>
>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>> +			   int priority);
> 
> A good cleanup, vmscan.c is so huge.
> 
> I'd like to introduce a new header in mm/ directory and contains those
> declarations of functions (like this and other debug function in
> shrinker_debug.c) since they are used internally across mm.

How about putting them in the mm/internal.h file?

> 
> Thanks.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
