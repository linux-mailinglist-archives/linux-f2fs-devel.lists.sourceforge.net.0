Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFB897D29
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Apr 2024 02:43:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsBCm-0000lA-C9;
	Thu, 04 Apr 2024 00:43:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1rsBCk-0000kq-C3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 00:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WpGECF9etbyajJ44AaV6qklkz1QRbKFBVu7gebo66/o=; b=Y1x2Gm6UrRwLSF+9x4sOiSLjmx
 L9Aj9eMJM7aS1VxNHo/7iSPKHNTlEwwierJhepjje38XOyg8ymjZbye4N2jkT7YFZ2k/7X7uo0Sw/
 wUsEnbscUnoCkSYVA5azKroilcM+aVadKp9xZNly8qsgr0i9uSvalYKtzyr1ZxIDtAgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WpGECF9etbyajJ44AaV6qklkz1QRbKFBVu7gebo66/o=; b=kZATfCT14VdBsroglwxX0bHxnI
 PMX2F5WHGBu+ys7TSbUGk+vfC2r4sK7igWv5ged+2hebLYJClioSuuXnFUckhlDsFwshdMyUJaOhz
 GuOSNTAbhpkm5OLiRrFF3WxsW5MgGJZ6fDXd4JnwzkAPdWy6qHnjHjU0U64xG8hFRyGw=;
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsBCj-0006KI-JU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 00:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1712191414; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=WpGECF9etbyajJ44AaV6qklkz1QRbKFBVu7gebo66/o=;
 b=QKbDMANoCLoY3VVtW1NmQ+cBzAtpoTZy++IhzuVib/V//+CSyLw16Gmb+rDYbQhhlGbiNwhjmKOtg4Hn3KVGezK3j4E/+LD3I8YVJ+rbGK0cEhL17OIXWU9FaPgOfMkp/ugQI5vg3DncqnIlKMJr3fMsY4d5WjgbK0uVNrAnvq0=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0W3t.vBW_1712191411; 
Received: from 192.168.2.4(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0W3t.vBW_1712191411) by smtp.aliyun-inc.com;
 Thu, 04 Apr 2024 08:43:33 +0800
Message-ID: <ad7ebace-9146-4824-85fb-d65416ad8895@linux.alibaba.com>
Date: Thu, 4 Apr 2024 08:43:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Jonathan Corbet <corbet@lwn.net>, Kent Overstreet
 <kent.overstreet@linux.dev>, Brian Foster <bfoster@redhat.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kernel-team@meta.com
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <dce83785-af96-4ff8-9552-56d73b5daf98@linux.alibaba.com>
 <2896ee5a-b381-45eb-abc0-54e914605e46@dorminy.me>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <2896ee5a-b381-45eb-abc0-54e914605e46@dorminy.me>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 2024/4/3 23:11, Sweet Tea Dorminy wrote: > >> >> I'm
 not sure why here iomap was excluded technically or I'm missing some >>
 previous
 comments? >> >> >> Could you also make iomap support new FIEMAP [...] 
 Content analysis details:   (-15.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.113 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1rsBCj-0006KI-JU
Subject: Re: [f2fs-dev] [PATCH v3 00/13] fiemap extension for more physical
 information
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 2024/4/3 23:11, Sweet Tea Dorminy wrote:
> 
>>
>> I'm not sure why here iomap was excluded technically or I'm missing some
>> previous comments?
>>
>>
>> Could you also make iomap support new FIEMAP physical extent information?
>> since compressed EROFS uses iomap FIEMAP interface to report compressed
>> extents ("z_erofs_iomap_report_ops") but there is no way to return
>> correct compressed lengths, that is unexpected.
>>
> 
> I'll add iomap support in v4, I'd skipped it since I was worried it'd be an expansive additional part not necessary initially. Thank you for noting it!

Thanks, I think just fiemap report for iomap seems straight-forward.
Thanks for your work!

Thanks,
Gao Xiang

> 
> Sweet Tea


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
