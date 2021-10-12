Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3E42A77C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Oct 2021 16:41:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1maIy1-0005HG-CG; Tue, 12 Oct 2021 14:41:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <krisman@collabora.com>) id 1maIxz-0005H3-VL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 14:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dh+iZtM6LZqYoz/uzmt0/FAQimIUgrkzJNS4SNJlyd4=; b=e88jTGRfA/8KEbj+pG4lbbZpZ8
 CrV3ktkjcHIfrdvkOQPFAa2cUadtpSAxxavuFPZ6dcXcACfAMfvJ54XBCB8ZWL/R+W8NF5tZmMDeq
 pTPeTGH6NWvrm9YPk/KCfcoSozW0euDIhSDc8AYiT5YJUAYOA+MxmFNhkmS7/XTldRpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dh+iZtM6LZqYoz/uzmt0/FAQimIUgrkzJNS4SNJlyd4=; b=M1bMxAlxFR0pkGG0S2LxDyVacN
 n/Rgn9bsU1T790af7KlJ3+VLPEQ7dXUTObITsHRHeu/Uwna84rEgwPtiOQrl/f8b1YwSckDlPzocW
 qT3FLcd1jDUNmZbgHaeUKrAD/Fz2VIJkOTLSTIvq5WmKckT4y3z6yq9sjHBR3fSLO3XI=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1maIxx-0002Qi-Av
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 14:41:19 +0000
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1007])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C039F1F43333;
 Tue, 12 Oct 2021 15:41:08 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Christoph Hellwig <hch@lst.de>
Organization: Collabora
References: <20210915070006.954653-1-hch@lst.de>
 <20210915070006.954653-11-hch@lst.de> <87wnmipjrw.fsf@collabora.com>
 <20211012124904.GB9518@lst.de>
Date: Tue, 12 Oct 2021 11:40:56 -0300
In-Reply-To: <20211012124904.GB9518@lst.de> (Christoph Hellwig's message of
 "Tue, 12 Oct 2021 14:49:04 +0200")
Message-ID: <87sfx6papz.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Christoph Hellwig <hch@lst.de> writes: > [fullquote deleted]
 > > On Tue, Oct 12, 2021 at 08:25:23AM -0300, Gabriel Krisman Bertazi wrote:
 >> > @@ -187,6 +207,7 @@ EXPORT_SYMBOL(utf8_load);
 >> > >> > void utf8_unload(struct unicode_map *um) [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1maIxx-0002Qi-Av
Subject: Re: [f2fs-dev] [PATCH 10/11] unicode: Add utf8-data module
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christoph Hellwig <hch@lst.de> writes:

> [fullquote deleted]
>
> On Tue, Oct 12, 2021 at 08:25:23AM -0300, Gabriel Krisman Bertazi wrote:
>> > @@ -187,6 +207,7 @@ EXPORT_SYMBOL(utf8_load);
>> >  
>> >  void utf8_unload(struct unicode_map *um)
>> >  {
>> > +	symbol_put(utf8_data_table);
>> 
>> This triggers a BUG_ON if the symbol isn't loaded/loadable,
>> i.e. ext4_fill_super fails early.  I'm not sure how to fix it, though.
>
> Does this fix it?

Yes, it does.

I  will fold this into the original patch and queue this series for 5.16.

Thank you,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
