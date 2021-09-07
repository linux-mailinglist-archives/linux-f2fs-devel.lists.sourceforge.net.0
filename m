Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DC9402E37
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Sep 2021 20:12:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mNfaO-0004lw-7R; Tue, 07 Sep 2021 18:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mNfaK-0004lp-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Sep 2021 18:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPQ+nPkyctiSoFwjYHe+5+zlrPTqX7VHvSEjcWmKOqU=; b=L+3ug7gf7oEf1gBz8FLK6dy6hl
 2u0RmSlKsuer11d+DAX90wb9kN+3GD7HBSt45tinDT90hO3K+Lee/7p+1AdxdJbOlYQbZq0vvlOwi
 s86MnfDLCd1GCKcBOkfYOoevW7VJy+cGGY0f+sAsDjV6SwPZKIyMTtEyzwnjlQvCzGL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RPQ+nPkyctiSoFwjYHe+5+zlrPTqX7VHvSEjcWmKOqU=; b=EbM9a1IU3d+ynIDw1ZPcYWb2US
 akDbx2P6/Z8KvTgGhuW8IhTyj6phmY5tkDd3UoNtw1JosFC36r+vHBzmzv2Qk4xGduj22Cmc2DclF
 88dARLR6Oyrz6DyTQztpXL13o1g0sogl65hwW2mDmDRx4uoLuvMRxDHgeEbJcKexZrE0=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mNfaJ-001OeD-7F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Sep 2021 18:12:40 +0000
Received: by mail-lj1-f172.google.com with SMTP id j12so17927901ljg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Sep 2021 11:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPQ+nPkyctiSoFwjYHe+5+zlrPTqX7VHvSEjcWmKOqU=;
 b=IMcjfhvhnkuWBL6uN8LkHcuDiuYpvEWztGTZ/9xC+7AMWAesGHu+c4rL2RV3ZlrYsm
 8pqtiROpED/MITGIurNKLgLyJSxti0vQnUaIKth6teBZFx8R9hHmMjfEyYVNhocUDZOo
 Qi2CZ+mQqk6O+36YauxwGYF4LtBcgRaCk88okEgcqfRhq/20MFIaqvmnP45yNC00gzIx
 NIz00qc23/+N5Yq1vOs2dJVVgMPNSHJj4fjndKFupf+x4B8XQ7STaBvMgm+h1JPCtbeg
 mIHsxeQO0/MFLqLwuszsysjrICrvQEGY9ml1hMLErHJxGz003qjzopPanXCYAGioY4QT
 /rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPQ+nPkyctiSoFwjYHe+5+zlrPTqX7VHvSEjcWmKOqU=;
 b=M6clSKseyoL4kcGA56iIYmkg0lYgcek5ymq/fRV2zQex/regE9A58E9aiKYcsixTvA
 BxN2oEGvtNKbig9XCO7xcwgM+3y1nfPgM6E/aMe6fqDIvC67LToKq2IE0HVAd/DXQAPt
 aqO/27mfnIba/5Y/zrhno0jtc/5V1Qa3DFL0EkQ5OYf5RabSkOzPHRp3xGXUfkAVXUea
 XOjlKYNJ5123O6Zeqjt+p9JL3Z1VxAgRdwasOaYDz00JBkAdvAllxATjI+JefLXVb/IG
 lbbdH9Mw5BkAlwSEgPAFxpUioDXye3gF+aBwhqBPHhZ5DhB/NJs+T6rNMO0M4kin8er6
 oJUg==
X-Gm-Message-State: AOAM5310dA60e3wP7QmIMglelw3B1hzzF06m/CNH1oKpgMF5i7TzZYYB
 +pTIrZzRz4tWvyAhZW1BbtflnxlOs/rMPdrN7mE=
X-Google-Smtp-Source: ABdhPJxj0iym9uah8XB56z0pqDOAWguqvVXa/WLkhjYxbkrLSWRCTbhBAHiUXNBIB67Z4s/bOmLnyAhAPafHUxvFYZA=
X-Received: by 2002:a2e:6c09:: with SMTP id h9mr15482853ljc.30.1631038352606; 
 Tue, 07 Sep 2021 11:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
 <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
 <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
 <CACOAw_yBYZzUVGV-A7K57zqrcAaZv7nFSk9mSj9AC6jTTeU7Vw@mail.gmail.com>
 <f64cb941-2bb7-eed2-732d-c9537f46f67c@kernel.org>
In-Reply-To: <f64cb941-2bb7-eed2-732d-c9537f46f67c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 7 Sep 2021 11:12:21 -0700
Message-ID: <CACOAw_zxq=SX0OdXV77HyFytJc6aCMbYuS6KZAR_JoQeGZ26Sw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 3,
 2021 at 11:45 PM Chao Yu wrote: > > On 2021/9/4
 12:40, Daeho Jeong wrote: > >> As a per curseg field. > >> > >>> Maybe, we
 run into the same race condition issue you told before for > [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
X-Headers-End: 1mNfaJ-001OeD-7F
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 3, 2021 at 11:45 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/9/4 12:40, Daeho Jeong wrote:
> >> As a per curseg field.
> >>
> >>> Maybe, we run into the same race condition issue you told before for
> >>> fragment_remained_chunk.
> >>> Could you clarify this more?
> >>
> >> e.g.
> >>
> >> F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_FIXED_BLK
> >> fragment_chunk_size = 384
> >> fragment_hole_size = 384
> >>
> >> When creating hole:
> >>
> >> - f2fs_allocate_data_block
> >>    - __refresh_next_blkoff
> >>      chunk locates in [0, 383] of current segment
> >>      seg->next_blkoff = 384
> >>      sbi->fragment_remained_chunk = 0
> >>      then we will reset sbi->fragment_remained_chunk to 384
> >>      and move seg->next_blkoff forward to 768 (384 + 384)
> >>    - __has_curseg_space() returns false
> >>    - allocate_segment() allocates new current segment
> >>
> >> So, for such case that hole may cross two segments, hole size may be truncated
> >> to left size of previous segment.
> >
> > First, sbi->fragment_remained_chunk should be seg->fragment_remained_chunk.
>
> Oh, correct.
>
> > I understand what you mean, so you mean we need to take the leftover
> > "hole" size over to the next segment?
> > In the example, the leftover hole size will be (384 - (512-384)). Do
> > you want to take this over to the next segment?
>
> Yes, the left 256 block-sized hole should be created before next chunk
> in next opened segment.
>

Chao,

Do you have any decent idea to pass the left hole size to the next
segment which will be allocated?

Thanks,

> Thanks,
>
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
