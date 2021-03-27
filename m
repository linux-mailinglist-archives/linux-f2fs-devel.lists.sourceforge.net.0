Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38034B743
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Mar 2021 13:41:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQ8G8-0005DH-Ch; Sat, 27 Mar 2021 12:41:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nroycea@gmail.com>) id 1lQ8G6-0005D8-JP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 12:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PhhAdU2vyDWR26PJABfghl4j1PHQiIGVcs1RWv+L0aU=; b=lFPfdTYkrHHKoOe+vtCMOuMXCm
 0pEjGsJ8CTo5FdDH8GQDQGaaRChxs1g9lr0wcuAaYQKfY445RBR5Gsn6PfGi678e9X0kQV0X4lIsN
 QLKbHtALKUQ+jq42nKineMnbyvVOJ1he3Jb/har87der/WOHkZ9OBqBRsGC9jxDH8DcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PhhAdU2vyDWR26PJABfghl4j1PHQiIGVcs1RWv+L0aU=; b=GSkvf0O5dD/G1sN1t1AF/y36+h
 vH1TUnN78JlhS0a9mWymzWNtwWnmiQbg6snGXnAcS8yuWeN2nd2VUllip0mihPxwcgwhaFQW52cUC
 3yIy1QLXZxzyFt9hLGu1cuDd25QNgH5mG7fMVTxlq8S5FUB+ck9oXq+LBcuctwYhpQUk=;
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lQ8Fq-000LWD-ND
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 12:41:41 +0000
Received: by mail-ua1-f46.google.com with SMTP id l15so2487223uao.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Mar 2021 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PhhAdU2vyDWR26PJABfghl4j1PHQiIGVcs1RWv+L0aU=;
 b=QlSGlJscqNG3+XnbGoq58V3wf0SqefEhVk5krkgarOFm+trASoVXSyR+q41GNgyyub
 S1T+4kfVz/EpnprlKEvg8plSNwBIkQ1PAxqnLLf23s3xhO2nvyTRHfD9AhHN9DX187V2
 tciKgo1hXbBBvvgPtlYtpb6AAmglNi6cT3g1gb0AQWIp7XkA90ko8bwEKczf68qX3+KO
 Zxu49s/VYWyZtxlfeUUWBRQJEB3IWjUuUdooGbLF162lGo2JQKhuqKobt+qfFSdK8Xx8
 zNoBtpz7WELvc2fTBIy7vxWRFGC1kNYvbeQQB7x7jWirpwY/0XZD4A4d5FkJG22fFXNw
 fKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PhhAdU2vyDWR26PJABfghl4j1PHQiIGVcs1RWv+L0aU=;
 b=DdkCALkRYOZAiYJwgKlAfFi8tMG3PF/2L49BDMPqzB0NUfDWZOTgrqV5wbco78sq0P
 pncnl5E0tZXqK5j+sLSEQFvVFNMpHZQ00Br7q64PuyFfvv3R1PH7b5KRJao7UQKxuO5z
 0W5LPqglsDSHh5GIf8Oph+exJiISY4Tj4U/lCowZw9NrA6IL1SZfwdIggpKYtTlSHRT7
 j0q7GBdbWSYWz8PLj7O64Op5AgzT8yhQ/6rksJKPA4anYOaUhT0L9Z3HfdGH6nLkXFK5
 vXZYngKhu998kkhf+bHXDBU9SLBVXEcMUTL826CPZV9yfRnrnntNe/BYSafSnBb4fdjA
 4cyA==
X-Gm-Message-State: AOAM530Nf5vyXtiRgHtMpouiG8vyAvxZJhb68EfJqDrNHjLNSTIDbq11
 vJfisH6a2cdPdLl0SaNFBnZtAnB1c89paAbN/hyn3IfClGU=
X-Google-Smtp-Source: ABdhPJww1VHQhW4Eu1qqEf6Q/bjaehaCbOn5zArIN5usN8LpB7lovOX/dm1BjPaaI9mwryTbRpz958MzXhCd3axbOes=
X-Received: by 2002:a9f:24c7:: with SMTP id 65mr9957841uar.119.1616848880860; 
 Sat, 27 Mar 2021 05:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
 <20200714000347.GA19314@google.com>
 <CALaQ_hriyvF8yaSihvGEN1U2jufCQ5sj=aknN+1xB=4EbkBWaQ@mail.gmail.com>
 <20200714055407.GA94278@google.com>
 <CALaQ_hoviFQeBXODari+gzbBNkHCJk0u9Hqa3EzHksscrhKj1A@mail.gmail.com>
In-Reply-To: <CALaQ_hoviFQeBXODari+gzbBNkHCJk0u9Hqa3EzHksscrhKj1A@mail.gmail.com>
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Sat, 27 Mar 2021 07:41:09 -0500
Message-ID: <CALaQ_hq+Cxt7BhcEAMWXFwaOGVtVs6+kOZqoYPvze7ee-USY9A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nroycea[at]gmail.com)
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lQ8Fq-000LWD-ND
Subject: Re: [f2fs-dev] F2FS Segmentation Fault
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I don't know how much of it was the issue, but when I unmounted the
sd-card, and closed the cryptsetup for it, and then ran
non-destructive badblocks on it, I was getting ONLY errors.
I stopped bb, then pulled out the card, blew on it, wiped down the
contacts with rubbing alcohol, let it dry, put it back in and now bb
is running cleanly.
I then stopped bb, tried to cryptsetup-open it and it said the
partition is not a valid LUKS device.
Weird since I was using non-destructive.
Looks like I'm now forced to rebuild that partition.

I wish I had troubleshot the aspect of the sd-card being properly
seated. I know I've experienced something similar to it in the past
where files suddenly aren't able to be read. Once I reseat the
sd-card, everything was fine.
The last time I had to even remove the card was maybe 1-2 weeks ago
when I had to deal with a noisy power-supply fan.

The whole debacle (including btrfs, keyboard leds blinking) may very
well have been from the sd-card not being seated well.

On Sat, Mar 27, 2021 at 7:02 AM Nathan Royce <nroycea+kernel@gmail.com> wrote:
>
> An update, not quite 1 year later. I encountered another segfault issue.
>
> It began with my email report to the linux-btrfs mailing list titled
> "BTRFS Balance Hard System Crash (Blinking LEDs)" just the other day.
...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
