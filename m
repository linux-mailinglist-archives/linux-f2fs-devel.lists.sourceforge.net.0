Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB6bL5XopGlVvQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 02:32:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083741D24D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 02:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPcXDHjKBaYce1jix+rqZQRaiIQaZ1/slE1Hy+EeiM8=; b=j48wjncRbNCV7s+PoNcYVIBA4y
	iM4kZRbJLD/S3raw3v7lH4U0mfkZdOv1ajzYwaz6KXCGYl7ploxAqAQYmADB0vhzU4Gwf7TPwqCx3
	N//Ozl0Fl0gttxyJAGA0twmsmlKW8yLjXsdI1/IjIAaMzbayvxRBjv1Hpg3abfO6lZZA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vws8Z-0003Z7-LY;
	Mon, 02 Mar 2026 01:31:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1vws8Y-0003Yy-2d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 01:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JhT7v1knXpowQqINe8+iC2+D+BfLyaTKev86LOr75FU=; b=D41/NRbtvg/N/dM38SYlQK7QdV
 ayfTqKmRrV3kHpj3poqsIwHvBnBLrLGrkg16awJxyjudvkzoMgRSAj6AZObrIdEBEDaJNkgbcEzqY
 z6B1AsXGM1ZnR49oSoN/Z8BGMLVrTkcW0p/K32KYXjphIYKc+K3clIgY0emAm4oZHOEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JhT7v1knXpowQqINe8+iC2+D+BfLyaTKev86LOr75FU=; b=DU4KNK5QFk9phGHSq0dtVWPg/z
 RiWb0mdvHoDYiHMVWC5Tu5gz6as9IzMCj2H+QrH4w5wmOPksrRyXgjd/Q+fKc9HVYIdPWWhrVdidq
 PwW1s20Zb/OZiJ50PvHOOdhU5HhMNAv5nNHwx2sqeX7xAoSxTu4/0SHEPY8OgCvFnYTc=;
Received: from mail-dl1-f41.google.com ([74.125.82.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vws8X-0007dI-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 01:31:54 +0000
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-1274204434bso3306916c88.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 01 Mar 2026 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772415103; x=1773019903; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=JhT7v1knXpowQqINe8+iC2+D+BfLyaTKev86LOr75FU=;
 b=CZhMkAOAXcD2H4a52vt+L7QtfJyefgqJf2fdEIp+oQvFn6UpZlUovNhsZJRigLLGi+
 If9fFctJOSLgxSEV6Nuk2Kfk/JgbrWaKaTxWz3DXNNG6QHWPth7ANKpOpYc0SZfRwNyz
 Kt9l1TVUUWShDesvQlUcpXdceJstfkNebSquRDsg0vDIQ/970n8YVJXe5b2a5ikkXQ43
 ZK2kBsCwMLUPSYqtipQ1m1Em7/J4HVQGUnq9ojIVPVK6H/IHr+MT0jRPYbhDqiN2LC/1
 AEXv7hNDlKyuKn8iNTiBrp8d2m2LNwdxSyVkFGx1l6UdDsf6DExtbcqEWUkQu/QRR0Tm
 XtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772415103; x=1773019903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JhT7v1knXpowQqINe8+iC2+D+BfLyaTKev86LOr75FU=;
 b=F13hWnY2z+Ur58HNn/p25dXNhfubrdCJbTSPmMsaWQBvMsWGoeW8e+zYGKjpfj41C0
 uk0JFoglrIJHH4tBfAMsLee5TkB01ZqoebNxSYeKPbPLfbohPlRMTgTcVedAgoUdrLS9
 xd0Nkfxw5h5DzSuxyQOeEpo0MjedKX+R+UX2JKYT6LL8b4Iq1yc4dywsO1SD00FnjGq4
 IdXrjWp40RP9VyRCAxvORpOFfrPGhJQA4xuoQC0mMAjqRazd7b5/SeNxaCi5N3DxZFAU
 DmCYQDiPl5RAgFvv0Bs8YWAkpxaOPmIDUJYjd+ZUjNfz12axJDWHFiWHVZ3X/qG+nH0f
 3Nuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8WyNOjHKSMLaZjCnU4ZgYq2ay7bnvRWt8KX+7r2PlTo6A15gVJZ4nTT/v7WO+0kWXwieeGO/o8mFN2RIUJtKA@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw0d4xo/1wKDn4930gZD5GaH9lnU20xcrFbGu5wgG5k5EmvH1Xi
 rhgtOZ4ILD/3wRfAv/8WjwGoDMx0ec4Xg+JmeWK41hytQl7/CBU9vzCbAaRc1O+9
X-Gm-Gg: ATEYQzzXCwNYqnSk0Cz07i0Tt0habL0pJjVIxsw45ZEAH/hdZAd253N+811SF9A1dJH
 63leLuig3sDgZ+eR2p+A0qWdlEmxRogcnAssVrPOLgV5664VwTJnnc3W0hP3fsVp1yJZ9fa0nCf
 XywEjaqBJGFlEbqhZKVl+a32CsTUURbkfQBUmvjuIc0wL6yDFT7fSDnZTIOfZ7t7jeYn76NI1MG
 wXksM1psoj8Ndg6M60iJavOWXj1ou21uGuU3yGsi9o4GlP9wurwM1qYO/E0rgRYmhrbmvrJUn9y
 N65vti++8pT6kIcCc6NfKDcDOjCzVjXae/Zm3ofpZONMLPtVkBeoqAhCnPXENoz0qqSj/AYlOYo
 Ahlpp0L+chlqgqMCYBEz/28/mUUA4qlNUT0EfY1EG5ZI1zSO6Isr6ryiwXBO7spTEdGOnxHyRHR
 KHR7O4xrma9lLyP2JcPC2b8CmY3Bowio+HlyXY
X-Received: by 2002:a05:7022:a86:b0:11d:fd41:62c8 with SMTP id
 a92af1059eb24-1278f82a1b4mr3731573c88.13.1772415102716; 
 Sun, 01 Mar 2026 17:31:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12789a32dabsm13960926c88.11.2026.03.01.17.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 17:31:42 -0800 (PST)
Date: Sun, 1 Mar 2026 17:31:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chao Yu <chao@kernel.org>
Message-ID: <f64db726-4c1d-445f-b9ca-4b1a569b6fe7@roeck-us.net>
References: <20260107112218.1789-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107112218.1789-1-chao@kernel.org>
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Jan 07, 2026 at 07:22:18PM +0800, Chao Yu wrote:
 > As syzbot reported an use-after-free issue in f2fs_write_end_io(). > >
 It is caused by below race condition: > > loop device umount > - worke [...]
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [groeck7(at)gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [groeck7(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1vws8X-0007dI-I4
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid UAF in f2fs_write_end_io()
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
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,b4444e3c972a7a124187];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 083741D24D4
X-Rspamd-Action: no action

Hi,

On Wed, Jan 07, 2026 at 07:22:18PM +0800, Chao Yu wrote:
> As syzbot reported an use-after-free issue in f2fs_write_end_io().
> 
> It is caused by below race condition:
> 
> loop device				umount
> - worker_thread
>  - loop_process_work
>   - do_req_filebacked
>    - lo_rw_aio
>     - lo_rw_aio_complete
>      - blk_mq_end_request
>       - blk_update_request
>        - f2fs_write_end_io
>         - dec_page_count
>         - folio_end_writeback
> 					- kill_f2fs_super
> 					 - kill_block_super
> 					  - f2fs_put_super
> 					 : free(sbi)
>        : get_pages(, F2FS_WB_CP_DATA)
>          accessed sbi which is freed
> 
> In kill_f2fs_super(), we will drop all page caches of f2fs inodes before
> call free(sbi), it guarantee that all folios should end its writeback, so
> it should be safe to access sbi before last folio_end_writeback().
> 
> Let's relocate ckpt thread wakeup flow before folio_end_writeback() to
> resolve this issue.
> 
> Cc: stable@kernel.org
> Fixes: e234088758fc ("f2fs: avoid wait if IO end up when do_checkpoint for better performance")
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c30e69392a62..8550c964b71c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -356,14 +356,20 @@ static void f2fs_write_end_io(struct bio *bio)
>  				folio->index != nid_of_node(folio));
>  

From the code:

#ifdef CONFIG_F2FS_FS_COMPRESSION
                if (f2fs_is_compressed_page(folio)) {
                        f2fs_compress_write_end_io(bio, folio);
                        continue;
                }
#endif

...

>  		dec_page_count(sbi, type);
> +
> +		/*
> +		 * we should access sbi before folio_end_writeback() to
> +		 * avoid racing w/ kill_f2fs_super()
> +		 */
> +		if (type == F2FS_WB_CP_DATA && !get_pages(sbi, type) &&
> +				wq_has_sleeper(&sbi->cp_wait))
> +			wake_up(&sbi->cp_wait);
> +

As the above snippet shows, the wakeup logic is now skipped for compressed
pages, and may be skipped entirely if the last page is a compressed page.

Also, givven that f2fs_compress_write_end_io() is kind of similar to the
code below for compressed pages, does that mean that there is a similar
potential UAF vulnerability for compressed pages in that function ?

Thanks,
Guenter

>  		if (f2fs_in_warm_node_list(sbi, folio))
>  			f2fs_del_fsync_node_entry(sbi, folio);
>  		folio_clear_f2fs_gcing(folio);
>  		folio_end_writeback(folio);
>  	}
> -	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
> -				wq_has_sleeper(&sbi->cp_wait))
> -		wake_up(&sbi->cp_wait);
>  
>  	bio_put(bio);
>  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
