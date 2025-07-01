Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556AAEF1A4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 10:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgQoTHl/mGhp6Yhv24ygWjnLCRwcfDamP6tbYdcVf2o=; b=baUGZyWmOHbPsHWmAunAw5WkjW
	mYlNFypd5sdgfBlvNJrA9rYl/WEYIN1ElTIP4wk/GLh9cEcoPnNQOJlbZnVlcsnq3NYPIi/vU0aJk
	8CDtTyaovoixdkJvI5gjwRubpfMAq2lXw02hLHTY/V5Kw8RKnF4WCbfqw1XkZDNif6A8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWWdh-0003sN-La;
	Tue, 01 Jul 2025 08:46:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uWWdg-0003s9-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 08:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YudY/ZM/rmx3cSbEA/yES/Ra50DzYmrGbdlfV/TbpHU=; b=NWn8ajA7pMXg1LEm5YTBlmncIT
 A8lXCAwC2gO5Jh93L+IZf0P7fx78YMfSuAQDQPcYYBvdIfjJf9oSH0MYYdZCSSb9W/yduw82Uo/Ds
 HbscL5cFwayh/x9X03/Jp8cw/VuabvO5c2AWvNam/G20Wq5scvVuG1+hwxBY37C3IFZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YudY/ZM/rmx3cSbEA/yES/Ra50DzYmrGbdlfV/TbpHU=; b=Vu+NtAU+QKE2nieXsKhbqof0Xv
 9W3MeOuyqnuqLrDYeKO3tPtqAJrw/uj8haaTzjpTZTV2xGnxi3id7TstCOjqeKBajOlx5xjf43xF2
 Cx45JPDg/pcFO5mPXVGXKya2CN3EWECTT6I9hiurVEY6q9iyRwLmCbY+n1Hn9r1yXgTs=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWWdf-0005Gz-OE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 08:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751359600; x=1751964400; i=quwenruo.btrfs@gmx.com;
 bh=YudY/ZM/rmx3cSbEA/yES/Ra50DzYmrGbdlfV/TbpHU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=T+zDCNDbE+FDw+y2Lbh6iqpoL6kMkHnQ7/EozmHoGdWcvMge52b6lcxV1lXUjACV
 6R9FfXkmqbEXgo6Dtq5lGRgVZr4tQAPkHbB/AwJDMA9xiGMfo1NBPdgsQmq/2U2ZE
 HAPS97e3arqDdT9YXNkNVgNppRRjjlwoiTI6EQnezX5d+iIAZnLF7mlbYQ6E01eiB
 W3DxCy97yfNkesG0+PCH48DxoqQjZxR7BLiDiuLK1iZL7AwdIdWI6H+Vw4VMGrNq3
 jCilJ4YZ5Mne45xJ2w+es0t+BkQ8AJIeXZw5K37kP7CY/O/Mvoudwmrlqk2DiRWed
 ikwy6u+3+pYwxrftDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MIMbU-1uTDFD1jpk-004ZPJ; Tue, 01
 Jul 2025 10:46:39 +0200
Message-ID: <db803720-66a6-4e0e-88ce-6b8a05845146@gmx.com>
Date: Tue, 1 Jul 2025 18:16:33 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Brauner <brauner@kernel.org>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
 <aGN8zsyYEArKr0DV@infradead.org>
 <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
 <20250701-beziffern-penetrant-ed93dbc57654@brauner>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250701-beziffern-penetrant-ed93dbc57654@brauner>
X-Provags-ID: V03:K1:tZio1FPOqX5rmOFKcRLf6dtEMceSPgpkWrQcDvgYxLZGTsic4PE
 0af3ZDmh/UaY7u8DxnvaWWUa4HoEBauptoTq9wEPvpXvGykuI/67+4cZdaldwbSf1e5BiPY
 xVHSooQ8Q8fgM/R6wjTi7rTLbnNDMgh+EywL9qf9IRt+z0cJWdm6WOg4D2KG778R142GYbn
 P9QujpMieBPJbVJ8/NTWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kvlb2w5npLI=;JVQoLpUuKRfZJiwHI9KietYGhuB
 0vKq6uQnQxLBeyzjMLiqbO2a+EuVJb8BzrrDIOHBtLUjzwHZyiXqovAh+wgKzA5y9lfOOw/EO
 Fphyl91ffDHNEtfR0ikc0Crq2sXsgb8F+rVFSl55oVsCIE1KfhAkkUXw3T9tUHGgW7GXRJyWC
 N/5+ERpOg8ncWJifwwACqQcl94cRfV11Owfk3pAn+WnG/upDhK0ktyvWFnWx2MYbG73U7Z7pc
 4UWEiilcg1SRp7ha1hDL78b4uexN1ZGAcQpvwO+2CKhfHRLzNZxCEeVTCUXwv8DY4imqmX5mR
 rRR4jkaTwHhy0sJ2gCLzoiy4DAqSK4FEol29VE6eDMNrc3LYH3kleVVYeKvNAyJ2p3LequqYq
 OOPCQfTtFnxqSXLf1HnBt7w4nouq1QNuFEvtMW2IOfT8fX+8Pzjv3OkSUSETq0OTZCGDs8tZ/
 26jXXNY5fLtI1a8qjs/MdoOPu8pjcUAq+qtsuOyRrV5EyeIloQH4zpFxpnl/NS2uF9Z8XN3fb
 Q3583xfJM8gZYreuHwJKf76aCjv1mycjkWqzvlv3Udwcd20YpLhlSQRG0zdf6PD78yta2+51b
 mXKnuB5m3cjOEmxPnLeY5aut7lzG151cyvDaULi+zd07bqfuKFwPWS+kRILk/x3DT9mNunuO3
 S7e09cJEKR+i+flXGiS4Qle1onhtz2RgAV5abSRD+WI90DsscnX5f/W7u9Ek3p1GQUjjUEq0w
 LVnky2bkGGDD0zls2VwfJcEL6LKZhPXHk6bM/pFVa7lJVfNMgvIBG53RFDoD3VMnVrtfFUCFy
 LLR1XtxtEap2jYE9n/44wTgd3rhiH9byp/Xu9O2qounUYzb2coRnCwXY9BYqfOytP+K++9dSi
 iJfucND50GXLnxd0HEgRHE6WWIQ59IyXXZHVMb/ZJooO9+hss+kcaeJaEw3LOaGvWAiNOKX8V
 1hCUrs8iJTPkywqLmWJ+3vZQAiwGMk4oowx3Xsjqz3rEbB5HNvRdyasRhBNAeCSeSWhVDb+pY
 iHIlYcUlXzlLWBzMb5wzeu5q/P/lEQIJdmpvbnuWbzITeUN/GjFBnFxjF837XwIYcqhx4S0zg
 CtYCqFtNd5UISUSqipL5D0gTmSfgLKYSHgtyGYJdZa9eU36cnqoDqMtyvI5Fooly+L+OVbn/c
 Kw8bu76WQr1TNbwfcptfWz+3IvJoZEOgSluct1ZNFgfFJy8XnmM9hZ1VpBx6+MR/s45gzrqWe
 qc7SLlukdkenl3ba9cUUOrfNkAkUeuDH7vm9442m0qA6Xz4/Jj0CbRUN1QJIs9N2hYRkwJA22
 r8qqGshBJ/20/LhnF/c3HcGBvFUE42uZoB3E7veDMOxKrY//H5NxbWlegqSRfc4RlMVtN0Q4+
 Y75LVkg/vLpbXOfjozREIFMhPnk0oF7a1KooTgKjW6XtY4X3EmUBlnZqcU1OZftQqz3HWeAA/
 PJV1S2lykhwLqcQPCBzR6HQ1k4Fnt/WbOyTJpEIY3jtuP1ZO1EH0+yJwwfULTDtyTERIEzvYD
 SE82iYx7DcSOxi9TbSgsukZkjPb3Ps6vqR+Xah7jLBOrti9+f3bHpzGCbHm/f8gQ5cTXVyn98
 IR/aN5t0/URgEmhwY4rBl6elqskBa5G/T1rScaEHKDMX6Vd2xq+QWYvfGWWsxpGplI+TgKwBg
 Gn08XlM5Jj/uS18/R6bMEA6D3TuprC0u3zBXcDUHXUVcXKHz1Afv1vIzE0hO6td7THPwgaLFn
 RpI37YSMgd/W/TQ177qqKlzUVckxwZ3IfROWhXGvvKp2EMwHYGHJVPXH8tzE3HK0S3+pqv1qs
 LURyCQj9rh7XHCPG2XaGIVWv1cpMHgiKQRN+TKA2BUwvGq0djn+MJX4KggyvLrf/FHH5gEVRl
 joT57Det13Q3T34g++EABmDIRs0w1cXdw7bprFaWetOGvZnnsUYIiyc1EQoNzr1QNRM7WyRhk
 BRzVifh5Nemwl9IO4w8bjY6sXyv7xPRSePcVYYSL5o5IhlkK/+/owGdXAxlTnks4HptCkSNzu
 hIo68un53Sl3b262qdU3wssHvKPc9WCO6ZvMdgIGsLvCcQCEU/bb4GNTw26O8uNY5ywThDjRL
 lQrwsuIYmWgdBA2erCx7M6lJlQTmpu/la/Qv7dutGgjJbgQeEEErXX9gt0c6Ofp0Sd+5GNFJ7
 R8i69+v6eV02V30eMvqfq2p8vTg+5Cr5F+ynWkP2x+30UGMURsmR9PCxuu+3u9hdWUXH/qX+3
 f2otjCDjtsI6P4ZblcPOoUllTnjXzOo6xGr5n6nFcND3E+iAnCzMN/JL01eGjU/JJZChN+bHk
 lVqt98pRnSHl4HUcxEgQ2HoLX/V5TvueuUbafE6S2gtOt2on9Jue4vy69ozfl7vlobaR10zme
 CSrQhJ787I+zdBj823yNz9zZVfQChhj/B7ZW3Bz7Xu3rf66C642z38/bj6KLzGbAbKm4aweQn
 s0maRr1ngIjRyJ2ZYQcHFKlHItQgmWjcV+u0U6ezqDvRz610BjB24utlZL2AIck8xFT9ZHiXz
 ftLqY88C2r5q82/BCUQjKoNJnJWTxegmyEIROgqw8HP/Qotcjr3zAg8fEn0z1C+5i06uiqfyR
 8D8vuq7mvmC+FuB1OU6E0zAhOA1hmH+tFdllkYqkFA7k9PJeXN4WQS3UutEXvQvYsT9dmru9s
 hnsAnderYxwWbDctkNNpyCTss6wg+P+LnYSzoitK4GePvAZNGhvJJxy04IqKcM8dNB5TFXn40
 Kqtw9E8WeNtNUoxico0q2CGFqZqckMzLGWWWgNT0u+5w2LM2mQ/9WxQceK9J4jThOk1iz4dFC
 7W2AN8aVXpYJNXp2RPoaW6NJHCN+xdb1E1/b2azxIkVVIOGOpEHZc2IcqM5txezjLEjyMckbt
 7NvnUUPw+HlRzGCrYkCVv2VWQNiynyplTexZN0TgRf82wRlvGUHSoo5jvR8ySjKh1QwJjFaYl
 KDQAeaJRm6wbgNql2BEYKoPHFJQTG08xw2uccxcg8vhTjsO7abvHEwoOC4zs6c6L9KbbapzG1
 9jL7c5Xn/0ggbqhzPCU5EV5VSp3WKD8L0+cy1x1+lcB0wTuxred/NdaneAB/wQkPqgXGFRpLT
 swn/EjYeo9CkMLLeFM5+ATmfyq073wGi7VwlEE0kdnHYpn1/ZiKYDh9z8PnKJeaT56GAubLI5
 PMwwmeORSJJAHVy9eh1fIi8z1RoTFSKzfsyhb0Z/n2BsQuv06T23PjUno2BhQyF3gt2w4VWgX
 j0QEK5LycoA4hYExKlrDb3jqbuvxZBAk5iK4JagzBvOB6pE4IGrzqbAyTOFcpRzcvZmND7lDE
 MzXL4YqFPOjmr8njuOQbqbOrHaVuU5Mt4Y2xqN84l7MG/QCV6Pr8DXc4ZJtIsk5jSePxqefln
 3/iQqe9O3X74mEmeizDkWgabNilDJ1pkdiRcPE/mj+uVPUD/QJ/6fkQQlBDWOwBj8WqBL1+1C
 4IlI9I0fyLL43wJHelRNVreUooi3N1BznpTf0D5eKwSC5IVW/ATf2mOlWPWwWynpmijkad9/B
 Gw==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/1 18:11, Christian Brauner 写道: > On Tue, Jul
    01, 2025 at 04:05:03PM +0930, Qu Wenruo wrote: >> >> >> 在 2025/7/1 15:44,
    Christoph Hellwig 写道: >>> On Tue, Jul 01, 2025 at 03:02:34PM [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.21 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uWWdf-0005Gz-OE
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: linux-xfs@vger.kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzEgMTg6MTEsIENocmlzdGlhbiBCcmF1bmVyIOWGmemBkzoKPiBPbiBUdWUs
IEp1bCAwMSwgMjAyNSBhdCAwNDowNTowM1BNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4+Cj4+
Cj4+IOWcqCAyMDI1LzcvMSAxNTo0NCwgQ2hyaXN0b3BoIEhlbGx3aWcg5YaZ6YGTOgo+Pj4gT24g
VHVlLCBKdWwgMDEsIDIwMjUgYXQgMDM6MDI6MzRQTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+
Pj4+IFRvIGFsbG93IHRob3NlIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyB0byBiZSBpbnRlZ3Jh
dGVkIHRvIHVzZQo+Pj4+IGZzX2hvbGRlcl9vcHM6Cj4+Pj4KPj4+PiAtIFJlbmFtZSBzaHV0ZG93
bigpIGNhbGwgYmFjayB0byByZW1vdmVfYmRldigpCj4+Pj4gICAgIFRvIGJldHRlciBkZXNjcmli
ZSB3aGVuIHRoZSBjYWxsIGJhY2sgaXMgY2FsbGVkLgo+Pj4KPj4+IFdoYXQgaXMgcmVuYW1lZCBi
YWNrIGhlcmU/Cj4+Cj4+IFJlbmFtZSB0aGUgb2xkIHNodXRkb3duIHRvIHJlbW92ZV9iZGV2KCku
Cj4+Cj4+Pgo+Pj4+IC1zdGF0aWMgdm9pZCBleGZhdF9zaHV0ZG93bihzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiKQo+Pj4+ICtzdGF0aWMgdm9pZCBleGZhdF9zaHV0ZG93bihzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+Pj4+ICAgIHsKPj4+PiAgICAJZXhm
YXRfZm9yY2Vfc2h1dGRvd24oc2IsIEVYRkFUX0dPSU5HX0RPV05fTk9TWU5DKTsKPj4+PiAgICB9
Cj4+Pj4gQEAgLTIwMiw3ICsyMDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1cGVyX29wZXJh
dGlvbnMgZXhmYXRfc29wcyA9IHsKPj4+PiAgICAJLnB1dF9zdXBlcgk9IGV4ZmF0X3B1dF9zdXBl
ciwKPj4+PiAgICAJLnN0YXRmcwkJPSBleGZhdF9zdGF0ZnMsCj4+Pj4gICAgCS5zaG93X29wdGlv
bnMJPSBleGZhdF9zaG93X29wdGlvbnMsCj4+Pj4gLQkuc2h1dGRvd24JPSBleGZhdF9zaHV0ZG93
biwKPj4+PiArCS5yZW1vdmVfYmRldgk9IGV4ZmF0X3NodXRkb3duLAo+Pj4KPj4+IFBsZWFzZSBh
bHNvIHJlbmFtZSB0aGUgZnVuY3Rpb24gc28gdGhhdCB0aGV5IG1hdGNoIHRoZSBtZXRob2QgbmFt
ZS4KPj4KPj4gSSBwcmVmZXIgbm90LCBhbmQgaXQgaXMgaW50ZW50aW9uYWxseSBsZWZ0IGFzIGlz
Lgo+Pgo+PiBUaGlzIGdpdmUgdXMgYSB2ZXJ5IGNsZWFyIHZpZXcgd2hhdCBhIGZzIGlzIGV4cGVj
dGVkIHRvIGRvLgo+IAo+IFF1LCB3b3VsZCB5b3UgcGxlYXNlIHJlbmFtZSB0aGUgaW5kaXZpZHVh
bCBmdW5jdGlvbnM/CgpTdXJlLiBJJ2xsIGtlZXAgdGhlIGZzJyBmdW5jdGlvbiBuYW1lcyBjb25z
aXN0ZW50IHdpdGggdGhlIGNhbGxiYWNrIG5hbWVzLgoKRXNwZWNpYWxseSB0aGVyZSBhcmUgYWxy
ZWFkeSBxdWl0ZSBzb21lIG1haW50YWluZXJzIHdhbnRpbmcgYSBjb25zaXN0ZW50IApwYXR0ZXJu
IGhlcmUuCgpUaGFua3MsClF1Cgo+IAo+IFRoZSBOQUsgbGF0ZXIganVzdCBiZWNhdXNlIG9mIHRo
aXMgaXMgdW5uZWNlc3NhcnkuIEkgd2lsbCBzYXkgY2xlYXJseQo+IHRoYXQgSSB3aWxsIGlnbm9y
ZSBncmF0dWl0b3VzIE5BS3MgdGhhdCBhcmUgcHJlbWlzZWQgb24gbGFyZ2Ugc2NhbGUKPiByZXdy
aXRlcyB0aGF0IGFyZSBvdXQgb2Ygc2NvcGUgZm9yIHRoZSBwcm9ibGVtLgo+IAo+IEhlcmUgdGhl
IHJlcXVlc3RlZCByZXdvcmsgaGFzIGFuIGFjY2VwdGFibGUgc2NvcGUgdGhvdWdoIGFuZCB3ZSBj
YW4KPiBzaWRlc3RlcCB0aGUgd2hvbGUgcHJvYmxlbSBhbmQgc29sdmUgaXQgc28gZXZlcnlvbmUn
cyBoYXBweS4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
