Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0677CA21
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Aug 2023 11:15:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVq8x-0000IJ-94;
	Tue, 15 Aug 2023 09:15:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qVq8u-0000IC-4S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Aug 2023 09:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=; b=R4vrIEyxOo8UVueNOQB4kmwCg6
 76Q5HGAP/z1gr5fTvSCck4HVJeH2Ycxae26kNpY7Ia83YBAFHNco5KX7mRnyNOKx0FH3GWdcFElfr
 ySRIapZWfqBX5+Tb3kJbE1y5dAdR0HHUGu46PfucGRUvr2hgbB1DV4L1v9YjOoPj27Xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=; b=hOGOY0tVXzv9jAzlTg2c70nqsV
 jPqX6DnIKeQdIQGgJ7zfkpqLnL4iPj4dO4QNv48D7VXRpXYSoEYpgKjrYHiKkuN0S4SESJXbzxF/F
 jxsKxmK8HOHb4N8D6er8z9meuGTny5gPpMYp34QCAHKNOeL9Ax7yHZZJQpz4hkOM0drw=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVq8p-00012r-8D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Aug 2023 09:15:12 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1bb91c20602so9096555ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692090901; x=1692695701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
 b=B4NWnukFtWBpBFBooLjjX+4xRi6cYrfaI8iegReeVzLQWKPXXt1CxHdKL4/tZ0fNPM
 0UExtQR6YZe58qkKHpbXtHQV0uPapic2RYOUTB+6Pi7LdOE1C7GEcaF7+zgpTtYtD/de
 UlP+/TDXrfMVghqI9OT3wDmB4f+60Ecld4ptmi3g4OGE44+/xTS+dFaCetp2KrysicqF
 +aYy3xTBT6yAIsFwZB/EdPqMFUGo82MatiM8ko8K8L/pW/bDYDRzwOeVlfM6AvdWPq+b
 HcGAAnq5GXzxPWbDmjMNdTVLUEtTfSjxZmvfFI4JrMMNezs7y6COdvHcs3klmaxHW6vC
 FHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692090901; x=1692695701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
 b=ROjjBUKGS594QmCGvZa+Fx6RAeEw+2ol+i1IIkS8Vlhs7mFzZZEUsjtkar5qByIOA8
 C/QljCtumNFw//H2/qoOXsy+lnIcw0JX6gjjh9YdLWOw3zY0M1w3Zli6ne33Xo0Lwj2G
 2fIhuf0wkckIDs37xRt9oIOIe/l+58VoqSy1VWvl7sX3mBfX12j9/XHo/3jVWxcL7jf0
 i8rz8/srdEFf/iIA+DBKHkSgXJasR4NMwa80cU8a5wchgMvVcQkz69QgKW0oA5+i9gz9
 BQy5kEl8rGAqAcoUDfiLL7R/O+MbUaxkf0rvsvAwgaf6/yEGoZ3nwGkJ70M/Q/y83N3z
 DggQ==
X-Gm-Message-State: AOJu0YyZzJx+ktnjnco7ukgdZslzkPZgQSCK67Z121CiMiSTrE+gAoc0
 IZVzXpm0tZ6HCeGJiTRxf4Dhtg==
X-Google-Smtp-Source: AGHT+IGKaQyK0d17VyjHV7p/Fr8yAF+2JMAJsl65uoihXD9UcmAUSi1eF134pFnOBdZUKl9ThFMr5Q==
X-Received: by 2002:a17:902:e5c8:b0:1bb:83ec:832 with SMTP id
 u8-20020a170902e5c800b001bb83ec0832mr13866844plf.2.1692090901535; 
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 io13-20020a17090312cd00b001b39ffff838sm10630843plb.25.2023.08.15.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Message-ID: <4f64cd2d-90e8-7902-7ef7-1ac58d51b2a8@bytedance.com>
Date: Tue, 15 Aug 2023 17:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
 <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
In-Reply-To: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/15 16:36, Muchun Song wrote: > > >> On Aug 7, 2023,
 at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote: >> >> The following
 functions are only used inside the mm subsystem, so it's >> bet [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qVq8p-00012r-8D
Subject: Re: [f2fs-dev] [PATCH v4 01/48] mm: move some shrinker-related
 function declarations to mm/internal.h
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
 Linux-MM <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, simon.horman@corigine.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/8/15 16:36, Muchun Song wrote:
> 
> 
>> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The following functions are only used inside the mm subsystem, so it's
>> better to move their declarations to the mm/internal.h file.
>>
>> 1. shrinker_debugfs_add()
>> 2. shrinker_debugfs_detach()
>> 3. shrinker_debugfs_remove()
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> One nit bellow.
> 
> [...]
> 
>> +
>> +/*
>> + * shrinker related functions
>> + */
> 
> This is a multi-comment format. "/* shrinker related functions. */" is
> the right one-line format of comment.

Will do.

Thanks,
Qi

> 
>> +
>> +#ifdef CONFIG_SHRINKER_DEBUG
>> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
>> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +      int *debugfs_id);
>> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +    int debugfs_id);
>> +#else /* CONFIG_SHRINKER_DEBUG */
>> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
>> +{
>> +	return 0;
>> +}
>> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +     int *debugfs_id)
>> +{
>> +	*debugfs_id = -1;
>> +	return NULL;
>> +}
>> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +	int debugfs_id)
>> +{
>> +}
>> +#endif /* CONFIG_SHRINKER_DEBUG */
>> +
>> #endif /* __MM_INTERNAL_H */
>> -- 
>> 2.30.2
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
