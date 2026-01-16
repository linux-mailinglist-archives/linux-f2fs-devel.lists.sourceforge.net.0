Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE724D2AC51
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 04:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3Rhdbghvl+oeBEK0p9TZRd45ZtiEDiZktuJKii34Wo=; b=QrvgbU/7OIwgjFLkM98a3BrhXN
	AMGXILj3XeG7GqSAZMYRQxOV9vF1kpdfc+l+3rkSAlJF1kuih0johOyPon0u2Riqb77haj1kamHRY
	/SjeVGRsz6AsqQFqheUT3NVyfVZPcrXg83wguIF/6+Vtk8jhQN8D7KKVKjt28/7rT16U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgaZG-0005E1-51;
	Fri, 16 Jan 2026 03:32:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vgaZA-0005Dr-GO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hk/oahptf+BXzzkU76pxqLubNUxXOLSzyIOL7TJCn8=; b=Jb4cCI/NObyhum4ClER5nTdJQ3
 ddJQhv0+PsnrrzGOpeRqsCkFj6q5HL7UQSH6XwC9SFUIezvWq9VqCtJmCeaGWwkXUUq1emVZUhJe6
 tm5a+MjTzDtU4DQ+SYAnWUvPD6a3+F6bGcAQGuTrnwRrp8UJm3Tc6pGCld7ohhiCbk6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3hk/oahptf+BXzzkU76pxqLubNUxXOLSzyIOL7TJCn8=; b=JyTWRRJn+kYRu20GN/fhVEQqL/
 Emgnwo+G0PYH26RU59KgTlEM9//j5dYdraIMf0AIgx/r3eJIwLTPV1m0Hm1MhfRj01Mzfd7VK3lng
 Wkp29mFsdwPM9W2i73iVYIaTwd++OE9jqgBlEYy7SSpdYZ5whBc6B2tNOxKRXLHDx19g=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgaZ9-0001A1-P5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=3hk/oahptf+BXzzkU76pxqLubNUxXOLSzyIOL7TJCn8=; b=L
 an0ie24+0PG+hy/YQZUfY7k9E3Sfgsf0Iv5jg+fAJeozZWkDaA8PRng6Zey8Sdlb
 5cGnmwQZp1LO0g+3QLJ1cuw4yMm+FRNYunI6flvakZJ5FRAQZ9156ul9TeSTZxS2
 2pYmj1nvkSVsnMRQCobuRcaeh7E4ug99yXVAKaCcA0=
Received: from nzzhao$126.com ( [212.135.214.2] ) by
 ajax-webmail-wmsvr-41-112 (Coremail) ; Fri, 16 Jan 2026 11:31:44 +0800
 (CST)
X-Originating-IP: [212.135.214.2]
Date: Fri, 16 Jan 2026 11:31:44 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <aWZ7X9yig5TK2yNN@google.com>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
 <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
 <5158ff31-bd7b-4071-b2b1-12cb75c858dd@kernel.org>
 <aWZ7X9yig5TK2yNN@google.com>
X-NTES-SC: AL_Qu2dCvmYu0sr4iOfYOkfmUgRgOw3XMSyu/oi2o9UO5FwjArj+iASW1VpF3XR19+sJCGAmSS7YDVeyP1feIJpWZkVdg8UDdDrThleUbZMcw84Kg==
MIME-Version: 1.0
Message-ID: <66927673.3096.19bc4dbe67d.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cCkvCgD3v1EhsWlpXsBFAA--.58960W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowEp+GlpsSGHZAAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Kim: At 2026-01-14 01:05:35,
 "Jaegeuk Kim" wrote: >On 01/12, 
 Chao Yu wrote: >> On 1/12/2026 4:52 PM,
 Nanzhe Zhao wrote: >> > >> > At 2026-01-12
 09:02:48, "Chao Yu" wrote: >> > > > @@ -2545,6 +2548,11 @ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
X-Headers-End: 1vgaZ9-0001A1-P5
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Kim:

At 2026-01-14 01:05:35, "Jaegeuk Kim" <jaegeuk@kernel.org> wrote:
>On 01/12, Chao Yu wrote:
>> On 1/12/2026 4:52 PM, Nanzhe Zhao wrote:
>> > 
>> > At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
>> > > > @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>> > > >    	}
>> > > >    	trace_f2fs_read_folio(folio, DATA);
>> > > >    	if (rac) {
>> > > > +		if (!folio_in_bio) {
>> > > > +			if (!ret)
>> > > 
>> > > ret should never be true here?
>> > > 
>> > > Thanks,
>> > Yes.Need I send a v3 patch to remove the redundant check?
>> 
>> Yes, I think so.
>
>Applied in dev-test with it.
>

Thanks for apply!

As an aside, I noticed that f2fs_folio_state removed the uptodate bitmap.  Do we need to 
consider the case where a bio ends up with bi_status set to error (which could potentially
 cause a large folio to be only partially read successfully)?

Also, is bio submission and the submit_and_realloc loop never fails ?

Thanks,
Nanzhe Zhao
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
