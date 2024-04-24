Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA188B08BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 13:55:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbDM-0007zT-79;
	Wed, 24 Apr 2024 11:55:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1rzbDL-0007zG-0H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/g2/UC+Qje9QaJR5m8snaCNqazDqqIhBRIym+PZEk0=; b=TKn4lfK++GEEr+q6+weHcjVWvt
 my6qf1VLnChWVwRHIei8XYEhxSX2fBIh6r6IgYi24M6oZYEooBN3+f45bYxyVToI/gkRlbzY7UkCy
 ozvKXq/8s6n9gyaCQU4KpRjPvkgwfYwdE/mb4RLvrS3ovREXNMJwEEUXXvep0v4y/ygU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/g2/UC+Qje9QaJR5m8snaCNqazDqqIhBRIym+PZEk0=; b=j2fkNU8oV+ca7e4mlvGx5G9Q24
 hF39gaNYNP8IIU5jdBOz6S3/n5SvuguyycaK9uS1iIN+FH5HUVTUJHcPGGQsV/hbUNXh2VmW4RpOz
 xoJYLTYi6TrbBlaIkOHUwhVM6UB94ho0fkicNalNYF++WRGcz7c0pK0TLOqRNFgLIx9Y=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbDI-0006Ij-ME for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713959695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o/g2/UC+Qje9QaJR5m8snaCNqazDqqIhBRIym+PZEk0=;
 b=cc4K0p6gxHms5tjvu8Watjmw4BoN9BDC0mXCoHsuWInL3z/wDFRTuSNvX1ycggGQer4w3H
 CxNMU4rAheZcQWkfjP4+8hSl/2Hsv/8G68T0bS8b2mtaqty/pC4ajqpP5Rc1GLNCFABj+h
 tEtvom3L4bLj9/NXi6jY99P3yoQUf9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-tNC85bToNTysPKnvOKItoA-1; Wed, 24 Apr 2024 07:54:53 -0400
X-MC-Unique: tNC85bToNTysPKnvOKItoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4147de378b9so38713145e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 04:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713959692; x=1714564492;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o/g2/UC+Qje9QaJR5m8snaCNqazDqqIhBRIym+PZEk0=;
 b=NSubW7AB1KO2roSGQTqt5ZQLMFG1AA/w1V+x0EfcdlHrcyhFoSP+Hi0DQxRHerQDPR
 vBoWBjjXOEf149k4KUVBce5SKrITOG6DCm/s/GQWtt1iYfnM5BeJXXnnXbtl2si2pALS
 DzWmVqlUaK159M159SW6Pc+0nCWkJjd5aOMNv4i7/ZYjBv1v4FjmtpjD7q+yKo55H4/E
 v9sftNEZwBoWg+/kN3n3Lps7lgEgHttMp2T6T95PNMT8Cv9e5zeakormcGgmNUYOAJPs
 Vke+XbqBbUAHKdYv+3gfZ0HgPi3ONUEpb8nqwX9YZY3eKNAWNxc8lMnN+uU5/2pItOdF
 GEFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqZPY0/pKYjaB/kQc9hLIV6IbxjLl5hCEfXjAOMcVxmQkH9nTbhZRHUU6ZAYWvbhdc3h6rrMoNkvWxS4gY27HIjBBAm2uLToNjysgBcl9ZZdlOZFbcKQ==
X-Gm-Message-State: AOJu0Yw+lFNVhnNg34/71MdVUqxPkqhVhIKiuB0Lsze5TCHwfl3XxmC3
 RSqDG5JZNMlkhYm5xMzMRe324GfwKR0oea0QiOyZIhCLZInvcI5usWFNSkC9PCuKh7iigSysClj
 roF5TyJdhCocJXNYPEAoDN/8A1dKHiMj8fjGKpuMc9BrfOS54P6XgzIbLAdH8mGj+Y29ByVeUuE
 Y=
X-Received: by 2002:a05:600c:5107:b0:418:d077:2cbd with SMTP id
 o7-20020a05600c510700b00418d0772cbdmr1528941wms.40.1713959692748; 
 Wed, 24 Apr 2024 04:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUBvlxAmoxjlaiMh//MyFbN3TugdeR/mJ1CsO1qWR48AZINKJVYj8LKvycJ6b2KKHRQbLutQ==
X-Received: by 2002:a05:600c:5107:b0:418:d077:2cbd with SMTP id
 o7-20020a05600c510700b00418d0772cbdmr1528920wms.40.1713959692321; 
 Wed, 24 Apr 2024 04:54:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:1f00:7a4e:8f21:98db:baef?
 (p200300cbc70d1f007a4e8f2198dbbaef.dip0.t-ipconnect.de.
 [2003:cb:c70d:1f00:7a4e:8f21:98db:baef])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm27443188wmo.21.2024.04.24.04.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:54:51 -0700 (PDT)
Message-ID: <8c6f78c8-8326-41f3-a477-395d89de445d@redhat.com>
Date: Wed, 24 Apr 2024 13:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20240423225552.4113447-1-willy@infradead.org>
 <20240423225552.4113447-5-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240423225552.4113447-5-willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 24.04.24 00:55, Matthew Wilcox (Oracle) wrote: > Removes
 a few calls to compound_head() and a call to page_mapping(). > >
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> > --- Reviewed-by: David
 Hildenbrand <david@redhat.com> 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzbDI-0006Ij-ME
Subject: Re: [f2fs-dev] [PATCH 4/6] migrate: Expand the use of folio in
 __migrate_device_pages()
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 24.04.24 00:55, Matthew Wilcox (Oracle) wrote:
> Removes a few calls to compound_head() and a call to page_mapping().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
