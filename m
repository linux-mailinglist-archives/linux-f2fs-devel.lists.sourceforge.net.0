Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050266307A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 20:35:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pExvC-0005oF-NQ;
	Mon, 09 Jan 2023 19:35:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pExvB-0005nf-Qu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 19:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQMDnAlZYFrg+FDGtR42bVuM/yGIczuxLJaq+U0aLyM=; b=Q9zK31WrMwEVoPZF5qoSM1hKuT
 inrH5Uy8QME7/uCukyuTkrTbm91SmhxhsW4kFrNUw4hr0YG/qbtjwTAdCQnCId5Qln0jL7/qBN589
 rkmcDkYIfKg1iPnZPwRse5CESmO3br36xbCEExhOBaD0D2hMteDwSZCdhD9PadIsCKco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CQMDnAlZYFrg+FDGtR42bVuM/yGIczuxLJaq+U0aLyM=; b=EFrIzIfnHdZim7JQXudLTZT2B1
 0Q2Ygf3nYWcsYJ2MhJny1Zjl57u1TFAhuXN3Bj4ZGp6QaTzYcDeCiR0R/WkNO46h0ZO7PIGBgqiJm
 Bh0gnyRuYiWYDnpAH2ez0r6d2OykKoXEsgiyt/KlkdlXqkKc97GLH0kfWptqBN7UydSo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pExv9-00BrFv-Um for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 19:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673292893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQMDnAlZYFrg+FDGtR42bVuM/yGIczuxLJaq+U0aLyM=;
 b=hbLVHclvn22XGXHqzDfRo4pknyu7gMd/o6TVpXU0sTbbbCfZ4s/+IVvGhj65EmndeOXVA6
 MeA4qcfBAB5CA5+2/q44LosGKlFC1EjRjz8DcbKwlb8XWx0PBHCueYQgIACLb52fzs7K1O
 38nQYKLOExhusZnmdzr5NGrM3l4RHWQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-7zPVan1XNhu7mnrlySK2rQ-1; Mon, 09 Jan 2023 14:34:50 -0500
X-MC-Unique: 7zPVan1XNhu7mnrlySK2rQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso6222236ejc.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Jan 2023 11:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQMDnAlZYFrg+FDGtR42bVuM/yGIczuxLJaq+U0aLyM=;
 b=up/8eYwxOhWFxLqRpOf6POYBtbBS5BXtmHXB7JLgtMlN8Q/lgPiK8Vm/11rKzvSkti
 HIC65QGHqd7spNMGdVlvvPyk6UY/8FbKBzD/xLAYf2mqr21xOG9evt1Lyw+pbXK0AB5A
 lOFo1O2w/0AuuCg8yWccLNXV7jDPBqO6e9z4MmyJJNWTuuN+SvEVHLU+W3oV/uQ9zkgq
 YjRmE2ecFrg1RHH5BVe09U4PpZpA9eyPSSwJRm7uWL8dORcp1YAb9ZrUaEE289hVoisi
 20vLRxODBCWtxbqqnNcW+vF46Io9JFlb0eZinw1ocIBpfK+pWKw9hCgQLG9qpqIsq8ky
 AK8Q==
X-Gm-Message-State: AFqh2krRVunhdaTxf6IlsHLDBxXU4QjbyQvm2KnmjwTm1/uQSBzhUJK5
 Ii59v4ToDp5PRNTVBwlnHpvKiIx7jFjWJwyg+GrV45hw8v9Sn5L4Ru3cdlkPNMSdh9/LgmYVSFc
 HINWFrSj3ZvagyoExkIzQLAr6rQ95gO4ljWrh
X-Received: by 2002:a17:907:1759:b0:7ad:d250:b903 with SMTP id
 lf25-20020a170907175900b007add250b903mr72215589ejc.56.1673292889359; 
 Mon, 09 Jan 2023 11:34:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu21stgD+/1EjhJf7J1BgUsBezxrJQMbjX6bK3yWH2CTzDuxtPuKAfnC7i/jdXetHE5M2jNRw==
X-Received: by 2002:a17:907:1759:b0:7ad:d250:b903 with SMTP id
 lf25-20020a170907175900b007add250b903mr72215575ejc.56.1673292889177; 
 Mon, 09 Jan 2023 11:34:49 -0800 (PST)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b0083f91a32131sm4076001ejh.0.2023.01.09.11.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 11:34:48 -0800 (PST)
Date: Mon, 9 Jan 2023 20:34:46 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230109193446.mpmbodoctaddovpv@aalbersh.remote.csb>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <Y7xRIZfla92yzK9N@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <Y7xRIZfla92yzK9N@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 09, 2023 at 09:38:41AM -0800, Eric Biggers wrote:
 > On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote: > > [This
 patchset applies to mainline + some fsverity cleanups I sent out [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pExv9-00BrFv-Um
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 09, 2023 at 09:38:41AM -0800, Eric Biggers wrote:
> On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
> > [This patchset applies to mainline + some fsverity cleanups I sent out
> >  recently.  You can get everything from tag "fsverity-non4k-v2" of
> >  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]
> 
> I've applied this patchset for 6.3, but I'd still greatly appreciate reviews and
> acks, especially on the last 4 patches, which touch files outside fs/verity/.
> 
> (I applied it to
> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=fsverity for now,
> but there might be a new git repo soon, as is being discussed elsewhere.)
> 
> - Eric
> 

The fs/verity patches look good to me, I've checked them but forgot
to send RVB :( Haven't tested them yet though

Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
