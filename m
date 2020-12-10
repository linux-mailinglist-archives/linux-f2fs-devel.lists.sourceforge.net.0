Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B272D50B2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 03:15:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knBTv-0004jw-PU; Thu, 10 Dec 2020 02:14:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <anant.thazhemadam@gmail.com>) id 1knBTv-0004jo-1g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 02:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqYt7x5l7ChS2b75CAGcZm7MBLEYVuTF7osXF52G8Po=; b=HW9qIlujG309pUBGa3XIFSG9vw
 kZs9jjDdYglwBM2OE31FAWJR1bdd/aEMP7leqFs+/qqCPGc1x8IbldNmwdAoY7LjKGA7MDhG4y5dS
 Lr7od2RGPsFyiSiGNOghbkduB3OeEFkAzOCgVICWp1ZDgITOjV7+X6+mzCSb1WoCjUh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tqYt7x5l7ChS2b75CAGcZm7MBLEYVuTF7osXF52G8Po=; b=IuyeHfEOuSgle4kkXiubtdAe5f
 OPl7xf75mU849UaeQVvqwApTJ1pILssurb2WSM4/KSaECIDiCrG5RRpLA5iWXlsm09Mog221fHKUv
 yAifchhDxtFQoDH7uMvlm7YkblrcfcbjNf5od8pT4uT11HsjZZQ2ZqfV+n02xG569Hqw=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1knBTr-008QEA-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 02:14:58 +0000
Received: by mail-pf1-f193.google.com with SMTP id c79so2589704pfc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Dec 2020 18:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tqYt7x5l7ChS2b75CAGcZm7MBLEYVuTF7osXF52G8Po=;
 b=rT+O8Q8aty5iKeOIzFBtXojHut1jcvFJfRHTulPh2QlvAh5UkiC4gc37ajD6/aMDcy
 qLjnFEeANDWqDfIlTHgL856Lh0PYN/TkINVJULc0bODDJLQf+7J2usPQQ8e5TM1S6igw
 mAb1TLd3WIGklO+I4JdAE+TP9OsEDAiMxhNoKARVzdsy015EDadwezR/fVSh65gEQqcb
 xmCHTqOD92wJhkzMTcKf05rHGUltpB2ZVPyvQATBb7gC+IQQP02zYLRN+5vmRdMxUavO
 rmnKMVWBzIZbyVyDIx5pp4TLI2m6I6D+SiYBLeVmOft2MqK6LITFb7CnYvQUM8SNeZFM
 GnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tqYt7x5l7ChS2b75CAGcZm7MBLEYVuTF7osXF52G8Po=;
 b=kYQLET91/w70VOh5T9EoR3xt2ElW0GVxIFa3JK4KG5fheWKYbvgpmSNh5GtDvHE8yI
 Bzh9JtYRJO2jNAkG7g2sZCcPmB9DJAFK7a57BqqCoejb3vXreZAgQTZo0mxdf4AnySu6
 CZey3ql1SbfSa3IQAk5FQudWjo8+hJ2d/7V8d6fyj11z02NLqWflP/xJcdioBvmiFJJ1
 JJTwjTemaib/KFaCFXRHlVhzS03+aYdG5qfbk/CvTloVZLuK3rWIlmNC9CKM4ha7f+US
 FwI2DUQlNke19YqMZ584V0DDghVoHIsfyf3hPl5OgJqOWNrrux0y5D/n8PIjNDY1ZuOd
 s0tA==
X-Gm-Message-State: AOAM533j0oSZR1IxRRkzXB2NZV3jQRCfhmyFkU3Rk4obZg7v0cQLo1nI
 CJw2DXhI1JRhX+DP8zvFdOf0pOmvjEUTLzBO1ck=
X-Google-Smtp-Source: ABdhPJwYwIrej0X4TLUrkQJqaiiNZrL+KnjY/BU4gXxR7PmF54P4iyXhbGaO3tXbvAqocUe3CjLCWw==
X-Received: by 2002:aa7:9f0f:0:b029:19b:c68f:61cd with SMTP id
 g15-20020aa79f0f0000b029019bc68f61cdmr4745491pfr.45.1607566489817; 
 Wed, 09 Dec 2020 18:14:49 -0800 (PST)
Received: from [192.168.0.104] ([49.207.210.144])
 by smtp.gmail.com with ESMTPSA id na6sm3319746pjb.12.2020.12.09.18.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 18:14:49 -0800 (PST)
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
References: <20201209181322.27932-1-anant.thazhemadam@gmail.com>
 <9e38608c-9fc3-1f94-d275-742facef3db3@huawei.com>
 <8d293b99-4414-1317-7426-79692bbaa715@gmail.com>
 <1215c353-3c3f-0a61-00a3-021f0c2f0032@huawei.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <38c68ef8-4b9b-cfc1-d8ad-cfeb4c2de845@gmail.com>
Date: Thu, 10 Dec 2020 07:44:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1215c353-3c3f-0a61-00a3-021f0c2f0032@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (anant.thazhemadam[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knBTr-008QEA-Rr
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: fix potential shift-out-of-bounds
 error in sanity_check_raw_super()
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 10/12/20 7:40 am, Chao Yu wrote:
> On 2020/12/10 10:00, Anant Thazhemadam wrote:
>>
>> On 10/12/20 7:16 am, Chao Yu wrote:
>>> Hi Anant,
>>>
>>> I've posted a patch a little earlier. :P
>>>
>>> https://lore.kernel.org/linux-f2fs-devel/20201209084936.31711-1-yuchao0@huawei.com/T/#u
>>>
>> Ah well, that's alright, especially considering that your patch looks better.
>> Glad that bug has been fixed nonetheless. :)
>
> Anyway, thanks a lot for taking time to fix f2fs bug. :)
>
> I prefer to add your Signed-off-by into "f2fs: fix shift-out-of-bounds
> in sanity_check_raw_super()" if you don't mind.
>
>

Sure, I'd appreciate that. Thank you! :D

Thanks,
Anant



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
