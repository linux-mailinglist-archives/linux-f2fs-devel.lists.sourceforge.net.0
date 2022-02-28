Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5F4C6BB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 13:04:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOekt-0005vZ-GA; Mon, 28 Feb 2022 12:03:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nOeko-0005v8-9I; Mon, 28 Feb 2022 12:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=; b=i8MioxSoTG3gXfn8IuKXw3ssbI
 4B2JorE8b3Ek1guKCh/oLy6R2OP3VJVu3aAf4Q3Joey7LCLN40mZuJ1r9l+lALNCrnVapeU0KNXMj
 ns3pTFKtmcHpFdd8nlKeyUBVQwzL0QOusgNF1WAqz77mVkWAe3mbKU6C4+u8SzNi/d8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=; b=fi9A+XIiEtzy40EoJuK+IfM0lQ
 gl3MzXXUE/9MMbOlVJzplfpU4W7Xxg0LhCxsRgLTlJOMxIn+fD615UbjPtP2UzV/jTsTZW8Y1su87
 IA2gNKOm2WiSpzT9YhMpBDdjuyges1foG+RpSBdm7O0yozk0/rStsCzX2nYYdYxN+/Zc=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOekk-00023B-RE; Mon, 28 Feb 2022 12:03:48 +0000
Received: by mail-ej1-f45.google.com with SMTP id hw13so24235025ejc.9;
 Mon, 28 Feb 2022 04:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=puET9FaE+iPLWSLHaH0Jc15P7LML3ILv/CtQc1xDRlDOvchBnePGr3CpZ8iNTFg26S
 MvdmzyKLao5C/5rXrSzR7jzTPZ0Yuj+7M+cqDE4eOMJCgAt9uraXgTEJwynFkzni1Fvy
 Vjo1HNa/jUOUFI/CmrkLVTegwpA5o7Cf0wR8qBn5y2xARegC4rz7JN5F70qSFE936vyK
 a6/WQ787WIaZ7lFx0I/tSaiXwe3z6FIrVBWdIQkzq0oVXXDZs7cCv56cl8qPmZ4RxzRI
 sP+DHiZk3rxPTft7o6PkfUdJMVZiSNaECaj+ljhYu978P5TkgTkfoRd54h/EuhklkuKS
 esTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=iJEDzITqYZGyBAtGM+Qq5iCbgltTX+aU5u2u0y848wJAY5wW9Jefo3GZmAw8SOW5no
 OjnRbjknbCsfAMktXRBnBu7nvVVvFo1JZFCJj2Aplu8+WiK8gvHi09fN5uhudIOCytBD
 d19pFx2VeatPPN13IZQnFEHKFsCbCz7M4PJFmZXcsllysXy/UREMTeyU7UGxBCvMBjAT
 mm0wVs51luYoXSoNhT5SfgBpPB43n4AwBL7Jf6Sg/Igt4TxzTMkHVUgTDYHRLnzqKEvF
 fjnCKNpRc9ZV+JV7wPuvWtk0rNQFTiS8ab75gqXt+t79SEu+Hs0TiiksSE0zMbdtIUKw
 l39w==
X-Gm-Message-State: AOAM532VtJpoHpY6NjZJh++xWfJS3RBDH8q6Oww65twjtuJyB9225aG7
 iquKrWc+AbFinJFVxis3CDs=
X-Google-Smtp-Source: ABdhPJyPihjoYwx+e9NKg98XvxKCbWi7t13guT1EBLKeJ6QGdK72cKHCeJpX8hRszpc83uJxZ+jQ9w==
X-Received: by 2002:a17:906:d14e:b0:6cd:8d7e:eec9 with SMTP id
 br14-20020a170906d14e00b006cd8d7eeec9mr14944415ejb.28.1646049820086; 
 Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b006ce04bb8668sm4257528ejh.184.2022.02.28.04.03.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:03:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220228112413.GA2812@kadam>
Date: Mon, 28 Feb 2022 13:03:36 +0100
Message-Id: <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 28. Feb 2022, at 12:24, Dan Carpenter wrote: > > On Mon,
 Feb 28, 2022 at 12:08:17PM +0100,
 Jakob Koschel wrote: >> diff --git a/drivers/usb/gadget/udc/at91_udc.c
 b/drivers/usb/gadget/udc/at91_u [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nOekk-00023B-RE
Subject: Re: [f2fs-dev] [PATCH 1/6] drivers: usb: remove usage of list
 iterator past the loop body
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On 28. Feb 2022, at 12:24, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> On Mon, Feb 28, 2022 at 12:08:17PM +0100, Jakob Koschel wrote:
>> diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
>> index 9040a0561466..0fd0307bc07b 100644
>> --- a/drivers/usb/gadget/udc/at91_udc.c
>> +++ b/drivers/usb/gadget/udc/at91_udc.c
>> @@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, struct at91_ep *ep)
>> 	if (list_empty (&ep->queue))
>> 		seq_printf(s, "\t(queue empty)\n");
>> 
>> -	else list_for_each_entry (req, &ep->queue, queue) {
>> -		unsigned	length = req->req.actual;
>> +	else
>> +		list_for_each_entry(req, &ep->queue, queue) {
>> +			unsigned int	length = req->req.actual;
>> 
>> -		seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> -				&req->req, length,
>> -				req->req.length, req->req.buf);
>> -	}
>> +			seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> +					&req->req, length,
>> +					req->req.length, req->req.buf);
>> +		}
> 
> Don't make unrelated white space changes.  It just makes the patch
> harder to review.  As you're writing the patch make note of any
> additional changes and do them later in a separate patch.
> 
> Also a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.
> 
>> 	spin_unlock_irqrestore(&udc->lock, flags);
>> }
>> 
>> @@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void *unused)
>> 
>> 	if (udc->enabled && udc->vbus) {
>> 		proc_ep_show(s, &udc->ep[0]);
>> -		list_for_each_entry (ep, &udc->gadget.ep_list, ep.ep_list) {
>> +		list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
> 
> Another unrelated change.
> 
>> 			if (ep->ep.desc)
>> 				proc_ep_show(s, ep);
>> 		}
> 
> 
> [ snip ]

Thanks for pointing out, I'll remove the changes here and note them down
to send them separately.

> 
>> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
>> index 7c38057dcb4a..bb59200f1596 100644
>> --- a/drivers/usb/gadget/udc/net2272.c
>> +++ b/drivers/usb/gadget/udc/net2272.c
>> @@ -926,7 +926,8 @@ static int
>> net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> {
>> 	struct net2272_ep *ep;
>> -	struct net2272_request *req;
>> +	struct net2272_request *req = NULL;
>> +	struct net2272_request *tmp;
>> 	unsigned long flags;
>> 	int stopped;
>> 
>> @@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> 	ep->stopped = 1;
>> 
>> 	/* make sure it's still queued on this endpoint */
>> -	list_for_each_entry(req, &ep->queue, queue) {
>> -		if (&req->req == _req)
>> +	list_for_each_entry(tmp, &ep->queue, queue) {
>> +		if (&tmp->req == _req) {
>> +			req = tmp;
>> 			break;
>> +		}
>> 	}
>> -	if (&req->req != _req) {
>> +	if (!req) {
>> 		ep->stopped = stopped;
>> 		spin_unlock_irqrestore(&ep->dev->lock, flags);
>> 		return -EINVAL;
>> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
>> 		net2272_done(ep, req, -ECONNRESET);
>> 	}
>> -	req = NULL;
> 
> Another unrelated change.  These are all good changes but send them as
> separate patches.

You are referring to the req = NULL, right?

I've changed the use of 'req' in the same function and assumed that I can
just remove the unnecessary statement. But if it's better to do separately
I'll do that.

> 
>> 	ep->stopped = stopped;
>> 
>> 	spin_unlock_irqrestore(&ep->dev->lock, flags);
> 
> regards,
> dan carpenter

thanks,
Jakob Koschel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
