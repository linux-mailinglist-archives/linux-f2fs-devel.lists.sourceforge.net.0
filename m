Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF4113904
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2019 01:56:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icfRd-0002eT-7r; Thu, 05 Dec 2019 00:56:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1icfRa-0002eF-8y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 00:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vz1ApiovfHKzY22SXz1c3rin1md/g2QMa0e8f8Sg83E=; b=Uu7tkWFgzc66eQuaSN/GUJPf4z
 lVx5Ki0DhdZy5r1QERZkFQPCu5SgKM/bwRFTAIn01v3onPVOM8P2rgADKEssQqstPZE6WNszDKhNu
 U80YLvefvmxCtj1bTUiQG7J3DlSyOdF4j6JfHTL18ISyhYzYyxTkeEZmfkSQ1Zq1LDMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vz1ApiovfHKzY22SXz1c3rin1md/g2QMa0e8f8Sg83E=; b=f4/jx464RWn0ZiK/pGnP0iuZ09
 hOZTJ1R4/C7W/LSyEoekcA3eP2TxW+wiLjz6BNHZQDCTXMPWZzpiCfHrVDUfCrhoPl3blN0M4L3F8
 tncZYMJXlNofsYJei4pQv6d//57k6MWFAsPbAfF14fARjEuaVs+NkYv28dGjWi8KNYRw=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1icfRV-00A4Zk-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 00:56:34 +0000
Received: from [10.130.0.36] (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxHxenVehdhgwHAA--.71S3;
 Thu, 05 Dec 2019 08:56:09 +0800 (CST)
To: Matthew Wilcox <willy@infradead.org>
References: <1575377810-3574-1-git-send-email-yangtiezhu@loongson.cn>
 <20191203135651.GU20752@bombadil.infradead.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0003a252-b003-0a8c-b4ac-6280557ece06@loongson.cn>
Date: Thu, 5 Dec 2019 08:56:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191203135651.GU20752@bombadil.infradead.org>
X-CM-TRANSID: AQAAf9DxHxenVehdhgwHAA--.71S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWkWF1kCr1UtFWxXFW8Zwb_yoW5AF1fpa
 y8tanrur4kKa4UAw1qqrsrZa4YgryxZ34DJryqgryv9rW0vw1qqas5Ca1UCa97JrWDWr10
 vrWrtwn8G34rt37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_twCF04k20xvY0x0EwIxGrwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
 6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
 4UJbIYCTnIWIevJa73UjIFyTuYvjxUybyZUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icfRV-00A4Zk-Ny
Subject: Re: [f2fs-dev] [PATCH v2] fs: introduce is_dot_dotdot helper for
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
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/03/2019 09:56 PM, Matthew Wilcox wrote:
> On Tue, Dec 03, 2019 at 08:56:50PM +0800, Tiezhu Yang wrote:
>> There exists many similar and duplicate codes to check "." and "..",
>> so introduce is_dot_dotdot helper to make the code more clean.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> v2:
>>    - use the better performance implementation of is_dot_dotdot
>>    - make it static inline and move it to include/linux/fs.h
> Ugh, not more crap in fs.h.
>
> $ ls -l --sort=size include/linux |head
> -rw-r--r--  1 willy willy 154148 Nov 29 22:35 netdevice.h
> -rw-r--r--  1 willy willy 130488 Nov 29 22:35 skbuff.h
> -rw-r--r--  1 willy willy 123540 Nov 29 22:35 pci_ids.h
> -rw-r--r--  1 willy willy 118991 Nov 29 22:35 fs.h
>
> I think this probably fits well in namei.h.  And I think it works
> better with bare 'name' and 'len' arguments, rather than taking a qstr.

According to the definition of struct qstr:
"quick string" -- eases parameter passing, but more importantly saves
"metadata" about the string (ie length and the hash), it seems there
is no need to use qstr to only check "." and "..", I will use "name"
and "len" as arguments in the v3 patch and move it to namei.h:

static inline bool is_dot_dotdot(const unsigned char *name, size_t len)
{
         if (unlikely(name[0] == '.')) {
                 if (len < 2 || (len == 2 && name[1] == '.'))
                         return true;
         }

         return false;
}

>
> And, as I asked twice in the last round of review, did you benchmark
> this change?

Before sending this v2 patch, I have done the test used with your test
program and already pointed out the following implementation is better:

bool is_dot_dotdot(const struct qstr *str)
{
         if (unlikely(str->name[0] == '.')) {
                 if (str->len < 2 || (str->len == 2 && str->name[1] == '.'))
                         return true;
         }

         return false;
}

[enjoy@linux ~]$ lscpu | grep "Model name"
Model name:            Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz

[enjoy@linux ~]$ ./test
qstr . time_1 0.025204 time_2 0.023717
qstr .. time_1 0.036542 time_2 0.034330
qstr a time_1 0.028123 time_2 0.022514
qstr matthew time_1 0.024282 time_2 0.022617
qstr .a time_1 0.037132 time_2 0.034118
qstr , time_1 0.028121 time_2 0.022527
[enjoy@linux ~]$ ./test
qstr . time_1 0.025200 time_2 0.023666
qstr .. time_1 0.036486 time_2 0.034275
qstr a time_1 0.028113 time_2 0.022514
qstr matthew time_1 0.024289 time_2 0.022515
qstr .a time_1 0.037058 time_2 0.034063
qstr , time_1 0.028117 time_2 0.022523
[enjoy@linux ~]$ ./test
qstr . time_1 0.025128 time_2 0.023692
qstr .. time_1 0.036687 time_2 0.034284
qstr a time_1 0.028133 time_2 0.022527
qstr matthew time_1 0.024246 time_2 0.022589
qstr .a time_1 0.037063 time_2 0.034106
qstr , time_1 0.028127 time_2 0.022522

Additionally, by declaring is_dot_dotdot inline, we can make execution
faster by eliminating the function-call overhead, so the performance
influence is very small with this patch.

If you have any more suggestion, please let me know.

Thanks,

Tiezhu Yang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
