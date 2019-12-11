Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530211A493
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 07:39:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieveJ-0001tW-9g; Wed, 11 Dec 2019 06:39:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1ieveH-0001t0-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 06:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lubuPp2BzYBadtV1qPHcympDdFWTzPsfZeBP7V9a6OE=; b=SgIxn3LMo0/p25BZl9YxfwRl54
 +3vy+gGYr7shX20MXBbA/MLVeJDwtrkcqTw8geY8JrhWW9nmyQ+0wQJzrGQvuQ2RqpfX/mm941YTn
 tzSXhKpQL0LOTpafxBLuKXF4ed+J9RbpLVt/tdtbk04XVQqZ+j2tpIqe1c8+ZyiZjoUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lubuPp2BzYBadtV1qPHcympDdFWTzPsfZeBP7V9a6OE=; b=Q5XIVhG6Q23EBx5F23GKTb7vJv
 XBfksnHkYIF6FizXp1raihLYv4AFB3L3uqMPYGCv85NXZKG3Z6S40/4k8rPnX2DyWQfWc36jSmo03
 LK/o64gaIl/a2VDkJqI/KyZVtJLBdiVVQy3Wocqxydx7N2CvytE1q+e1QMyyubIHBhP8=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1ieveD-004q3I-H7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 06:39:01 +0000
Received: from [10.130.0.36] (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxfxfvjvBdz38JAA--.103S3;
 Wed, 11 Dec 2019 14:38:41 +0800 (CST)
To: Al Viro <viro@zeniv.linux.org.uk>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
 <20191211024858.GB732@sol.localdomain>
 <febbd7eb-5e53-6e7c-582d-5b224e441e37@loongson.cn>
 <20191211044723.GC4203@ZenIV.linux.org.uk>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4a90aaa9-18c8-f0a7-19e4-1c5bd5915a28@loongson.cn>
Date: Wed, 11 Dec 2019 14:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191211044723.GC4203@ZenIV.linux.org.uk>
X-CM-TRANSID: AQAAf9DxfxfvjvBdz38JAA--.103S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry3KF4UGF4furW3Xry5urg_yoWkGrX_ur
 18Cw1DAF4UZr13ZwsxJFW7JFZxWFW5Wr1jvFyvv3y7AF98A398urWkKrsIva1UZr4fZFZI
 kryjyrWIqrW29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-AYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7jjgUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieveD-004q3I-H7
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/11/2019 12:47 PM, Al Viro wrote:
> On Wed, Dec 11, 2019 at 11:59:40AM +0800, Tiezhu Yang wrote:
>
>> static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
>> {
>>          if (len == 1 && name[0] == '.')
>>                  return true;
>>
>>          if (len == 2 && name[0] == '.' && name[1] == '.')
>>                  return true;
>>
>>          return false;
>> }
>>
>> Hi Matthew,
>>
>> How do you think? I think the performance influence is very small
>> due to is_dot_or_dotdot() is a such short static inline function.
> It's a very short inline function called on a very hot codepath.
> Often.
>
> I mean it - it's done literally for every pathname component of
> every pathname passed to a syscall.

OK. I understand. Let us do not use the helper function in fs/namei.c,
just use the following implementation for other callers:

static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
{
         if (len >= 1 && unlikely(name[0] == '.')) {
                 if (len < 2 || (len == 2 && name[1] == '.'))
                         return true;
         }

         return false;
}

Special thanks for Matthew, Darrick, Al and Eric.
If you have any more suggestion, please let me know.

Thanks,

Tiezhu Yang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
