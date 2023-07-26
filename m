Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E0763204
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:28:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOapC-0000sl-L1;
	Wed, 26 Jul 2023 09:28:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOap9-0000sd-2H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=; b=WqUtQeJ8vyo6FBhfPoc4wX97pF
 thnAXNsv2LGEpQVTa5c/ep1CiXetU4Lto5ONdZVOcaaLiTOBZTgRUIHF+CnGFWfIuDLg2ngkKEzoO
 ruacnDnCzi3kOGNByUgSy1wPvnxXeuCfui9d/PRdAgl8jlzKgUlGitf49dsNXDf4uxiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=; b=YrMflvMn0k0GXSO9oaudqHQwhw
 fMyAca/IwNhnn05lxy6nzTTnNGKzdJIBFkdlRWBXo5H6bZ12s+0XoC/EfL/IblB9PPXT9oAtiHxd1
 xWizyeZ8tEdXrePxEwmCY2Oi5hu6FRvyT62iezUAdpyHWu0RLEM2tMwB7hUQYaK3OL24=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOap8-002tNB-GO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:28:51 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so1654059b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363725; x=1690968525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=;
 b=RgneqgkXKODRrFr78EJ2DiU2LP1auMSsEluGXDNHK2/ImK1m1wgxIc9rc0KyChzerd
 9pp9E0d70JkoKPUeaRftr+jglcQl9qJ1NHO80UjvVHwRcDm/HyYkv/adcdLVyb0tT2RZ
 DBfPuhO0Xzb3EkxZ8Lnv+NpBNxlgzINPxdWjI2p4gXmhxr9F42wMDqq5WIk8CWvg0ei0
 04D2fNryYi6h/fKlwXKsAJNXxbdFzcjkeSQHK+ZzWAzpfHtAdyeZZlzM27TnNlh1u/69
 UWlC2QlusG6aR16W+ARLMoeEnjaKWlhVg7tepMtvkY5m/QLzYLh0WRDX9uQBe16cx9gs
 O9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363725; x=1690968525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=;
 b=N+oyM4XqASJJWupMKifDkZqZ6eHdQyIjIom9jD9thHcAB0EY72VSRAEKY5q5hWFG7D
 gf9EKX0EUh/7S/CVE82KnHokdjS+MQtBXwWwrXTGTg9+gDPF7eeF1voFk2T6hBtC/Lr0
 bwiRnqZuCpul0MvpEeLfakxk8rrG8preJ/b86HbuFTLUIBFyJNqV5bnwPzw9oIf37U72
 vLvwgnP1LOWI6mYK6tUMYum7WrHycnooVn7O4lPhkYfa827ecNbcTzvCMTS5LLD+XSQ3
 qRPLMcBagLmyaKKqj47WCMJH6Ck3FCoYiImYqg0iO6utEaA6Q3XETaD0SG/3FBrAUOrz
 6gnw==
X-Gm-Message-State: ABy/qLZcMAj1uwFHaQ0Y3J2Wp3APY+kVgzZpUqPvhpSpwiqfPki3QnN0
 rWoZNoG87NbQZpucPrajNVboSw==
X-Google-Smtp-Source: APBJJlFvSUUJYrPzKxRMgKGWHa7iMtrF7iaocGD/XAPkPO20BZ2/Wf52mLvF02dnCC8LpFHDclZgZw==
X-Received: by 2002:a17:903:41c8:b0:1bb:83ec:832 with SMTP id
 u8-20020a17090341c800b001bb83ec0832mr2040388ple.2.1690363724990; 
 Wed, 26 Jul 2023 02:28:44 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 bc2-20020a170902930200b001a95f632340sm12591323plb.46.2023.07.26.02.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:28:44 -0700 (PDT)
Message-ID: <acb14ed0-b9ca-e7c9-e81b-a2db290a1b94@bytedance.com>
Date: Wed, 26 Jul 2023 17:28:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-22-zhengqi.arch@bytedance.com>
 <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
In-Reply-To: <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/26 15:13, Muchun Song wrote: > > >> On Jul 24, 2023,
 at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote: >> >> Use new APIs
 to dynamically allocate the mm-shadow shrinker. >> >> Signed-of [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOap8-002tNB-GO
Subject: Re: [f2fs-dev] [PATCH v2 21/47] mm: workingset: dynamically
 allocate the mm-shadow shrinker
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
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/7/26 15:13, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Use new APIs to dynamically allocate the mm-shadow shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> mm/workingset.c | 26 ++++++++++++++------------
>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/workingset.c b/mm/workingset.c
>> index 4686ae363000..4bc85f739b13 100644
>> --- a/mm/workingset.c
>> +++ b/mm/workingset.c
>> @@ -762,12 +762,7 @@ static unsigned long scan_shadow_nodes(struct shrinker *shrinker,
>> NULL);
>> }
>>
>> -static struct shrinker workingset_shadow_shrinker = {
>> -	.count_objects = count_shadow_nodes,
>> -	.scan_objects = scan_shadow_nodes,
>> -	.seeks = 0, /* ->count reports only fully expendable nodes */
>> -	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
>> -};
>> +static struct shrinker *workingset_shadow_shrinker;
> 
> 
> Same as patch #17.

OK, will do.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
