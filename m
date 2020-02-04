Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF4151CB9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2020 15:58:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iyzfB-0001Eo-EV; Tue, 04 Feb 2020 14:58:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+68879264702d8a6edaa1+6008+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iyzf8-0001Eb-5f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 14:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AfAKF0TXjgF6cXOTs0IpvR8bmv7Y5y+OTvhW+uwkYRk=; b=dueObL6sYj8f2S4hWYWp+sEZGl
 Muxa/7WDdyPMrWbL0h+iuSRubggPaHcdJL3KnJI8UwxWfYq5eCDJiKHLeo6jlFRvlEUxpoFy/KoIf
 K9k7r2Cm+r3mIvxL0i+jO4HDw/EYl/zewEQPrX9vvxNc7ggg1BZ/swApbJp48bNj3fJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AfAKF0TXjgF6cXOTs0IpvR8bmv7Y5y+OTvhW+uwkYRk=; b=OUb1hjq2d+b4n71L+WxGwPnlFO
 0XCbaBzkt4SLA0vthjlPVowUDyKHCx7T4sY08tT8vJKrFjVD8VPZilKmifEIhvQmQ5jhdjLRjZ4lc
 kwZHtC583xz/xZxd+dZDJWbOtq3mQZQXv3q4WIAXEYejje92nfhoJDxOfg8vrI+ULEeQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iyzf6-00A4NW-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 14:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AfAKF0TXjgF6cXOTs0IpvR8bmv7Y5y+OTvhW+uwkYRk=; b=jToIu+2geApo4hExEekSN8//Dd
 2Rr+plF0PB/eoNuH+8VtbAXDE4wYNJTu1b6Hwfffr8N7g3sN6DCWKoRtmBGp+SWEVhVij0/295+Xm
 3KYG9tLY7mPgoajeQTZgnjfrZ6xrGHk8TzUFisU2KUe3DsgMpPSiIh3ixf2CkKWhkGlX/KElGf4dk
 iZlJn5y8HhHxHYup8syqlIqOrhpMUibNDf2+udSBBTeqGaFZy2Kf3MVIgiD56cJ3muEF4LrO4XjLd
 fU8nHmNSSwQ/sLJtRKRlo+OkWXSuQnCeW7JZuczjuyrd1raDGzt3bW6Mw90hAGtEGOlHripIRvONT
 GICtGCaw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iyzeq-0001AI-T3; Tue, 04 Feb 2020 14:58:32 +0000
Date: Tue, 4 Feb 2020 06:58:32 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200204145832.GA28393@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20200108140556.GB2896@infradead.org>
 <20200108184305.GA173657@google.com>
 <20200117085210.GA5473@infradead.org>
 <20200201005341.GA134917@google.com>
 <20200203091558.GA28527@infradead.org>
 <20200204033915.GA122248@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204033915.GA122248@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iyzf6-00A4NW-CZ
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Inline Encryption Support
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
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 03, 2020 at 07:39:15PM -0800, Satya Tangirala wrote:
> Wouldn't that mean that all the other requests in the queue, even ones that
> don't even need any inline encryption, also don't get processed until the
> queue is woken up again?

For the basic implementation yes.

> And if so, are we really ok with that?

That depends on the use cases.  With the fscrypt setup are we still
going to see unencrypted I/O to the device as well?  If so we'll need
to refine the setup and only queue up unencrypted requests.  But I'd
still try to dumb version first and then refine it.

> As you said, we'd need the queue to wake up once a keyslot is available.
> It's possible that only some hardware queues and not others get blocked
> because of keyslot programming, so ideally, we could somehow make the
> correct hardware queue(s) wake up once a keyslot is freed. But the keyslot
> manager can't assume that it's actually blk-mq that's being used
> underneath,

Why?  The legacy requet code is long gone.

> Also I forgot to mention this in my previous mail, but there may be some
> drivers/devices whose keyslots cannot be programmed from an atomic context,
> so this approach which might make things difficult in those situations (the
> UFS v2.1 spec, which I followed while implementing support for inline
> crypto for UFS, does not care whether we're in an atomic context or not,
> but there might be specifications for other drivers, or even some
> particular UFS inline encryption hardware that do).

We have an option to never call ->queue_rq from atomic context
(BLK_MQ_F_BLOCKING).  But do you know of existing hardware that behaves
like this or is it just hypothetical?

> So unless you have strong objections, I'd want to continue programming
> keyslots per-bio for the above reasons.

I'm pretty sure from looking at the code that doing inline encryption
at the bio level is the wrong approach.  That isn't supposed to end
the discussion, but especially things like waking up after a keyslot
becomes available fits much better into the request layer resource
model that is built around queuing limitations, and not the make_request
model that assumes the driver can always queue.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
