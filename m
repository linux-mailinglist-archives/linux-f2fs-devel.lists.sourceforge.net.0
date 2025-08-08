Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7931B1E767
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 13:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeZGgXG/nvwj1ChXt0EQYEVhJ/BdW14Scyi8oh4YG0k=; b=ak/l3Afmq57ybHDPMI7LNPSHnN
	XAJ7yUkQxeDlOGx1GB763uUK7p5NNRZQh27L4CFNZcgnLCzUXD+WIu3clCU+CoizkylT4UgA1IC06
	SaWW68I184WESE+UYU1fjKvbzSg61+w1trwGBgBQKE1OrlvfwPYCq3zcaM+NttduUVDA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukLMv-0008HN-5f;
	Fri, 08 Aug 2025 11:34:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1ukLMs-0008HD-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 11:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pxBkjpoMQhREFtEinPrGk06Y/yhFPbm/wzckQXN3iLo=; b=LRLwBzmy7gGpEVtdpmcDscKYCK
 /SCyuvKCfvsyy87rnSdzA3bvTtgHLA+DAzHWboqJpCSggK/MQpA+Oxuew4ZuoOgPQLiBoEUgUxy2+
 qbP/U8yt3VOXZBqvLs8oT1jgBMu4o/zYybLXfwAI1hrOBKUGXGNoTLTgIchM6QG7Ll1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pxBkjpoMQhREFtEinPrGk06Y/yhFPbm/wzckQXN3iLo=; b=cg8caofXXByWdzxPHDvRsGok7w
 7AmZY8g9LUyGqAE0x6+KGU2RB/9q+NEQye/p8RW4p+NyBCXExbFvPB6IZlmndLrJEqQbJpwDZe/JG
 9ABNe7rWqQ24BFDMvNHCaf8SrNWZjRVBN4E2kqYWmHJmawyjIji8BwtIabrI58d2EijQ=;
Received: from mail-koreacentralazon11013060.outbound.protection.outlook.com
 ([40.107.44.60] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukLMr-0004it-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 11:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrfxonAsXe8yxmGG1BG7O4mFHhvYYz0IRqj3yEaFnYD8Cr6J3IcJP/Q0SSc420F6v7teq6pfEc7Rt363SKxqykJ0f6oLewGoJ2L19pnIDxVkNooZYH4SujnDynPSWskH6DT2Q3ygOGSRVyKXuCgMQJEqVmB3Y+ZxOFAo4YCFu6j9yqMs6q7tpmbbBBkpcS7EbHNzVxHK7aWy+jcHrKb1XIBuXsa8D72BHZRVKrHl3Wi7u5iBD7RSQ/DttVANEq57cdSXM0DWvzpFh1K/mcWtqxZHLnlJoLhJSClBwhlJKf4Kik96e0aC84bK28lo/gLvVmsHeY5/HK630AfoLJjgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxBkjpoMQhREFtEinPrGk06Y/yhFPbm/wzckQXN3iLo=;
 b=kyJVrbjivqCYsi5oKOAr3WT9SYxbimnf9mQHQ0kx5OIdc2x22Mw40GmICC5uQQ0oMTcqeu9JOeYSdM+ImgoIu7JI9fbLk2iH3ohvFOeKlPRzbZ3T5Lr532DadhurSXsGsqbBERtp5zxJJmB5OZD8Nj1C/SHjtnm864U0djFBQUTGQr/QYlZgxSP3PWKFpzAMHy5xXjdT5FnRXF4jHQcb6iQdRSWKgWXt+K6dMlYRhmcjbjO4E7dTl+jQ4YRc/ZM58zlP7GA2i3Wka3vLLio5tNJsvcftSMllrCKEhd7JcyPCc4vi0HquQJTjSbDvccVktQs1QnToeaUrx4xWsO/pjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxBkjpoMQhREFtEinPrGk06Y/yhFPbm/wzckQXN3iLo=;
 b=kM/avZQklRCrt2/kaLoGrNhcNG3ZvfgZBDT/BfwUFwTR9Md1W0C+uVd6kK/YfDbyDzmDUENIw7wV2uXa2ZvjKn+Klrr6d3boLIqY5aRuGJlJNZq2gT7i2lRm2NacCblAYgC9UvWlq6hdfgKIw+YcWJwZwFwXGZx6bTVk2hF7AnSrEFd3NmEA6/i/DwxzPyZgUV50MmlpBqcYMTrAKnZoG32ro5dMwc6Kjb4FzDHwZ4xrCYgGL5ziYpzpw2YcdoAKLE/VQuZkI9wG1WEF+IPDHe76X3j1bqhT9HOlOyDT4zyKk3EAofzBsb7j0O8g3xLLKG3sXsCNiatjqK7Vfv5q7A==
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com (2603:1096:408::90e)
 by TYZPR06MB6325.apcprd06.prod.outlook.com (2603:1096:400:419::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 11:34:22 +0000
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::6beb:51d8:f9a4:d4ed]) by TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::6beb:51d8:f9a4:d4ed%8]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 11:34:22 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chunhai Guo <guochunhai@vivo.com>
Thread-Topic: [PATCH v6] f2fs: add reserved nodes for privileged users
Thread-Index: AQHcB6AyGmwhYE8N5k6qpIRzhrRlabRXzfUAgADTjoA=
Date: Fri, 8 Aug 2025 11:34:22 +0000
Message-ID: <4549e456-498a-4406-94d0-2435758a2ab8@vivo.com>
References: <20250807133501.551848-1-guochunhai@vivo.com>
 <aJUvRjNZ124o-Quk@google.com>
In-Reply-To: <aJUvRjNZ124o-Quk@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY1PPF33E28B4E6:EE_|TYZPR06MB6325:EE_
x-ms-office365-filtering-correlation-id: 7c5952fc-d9f0-468d-e71a-08ddd66f8546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emlaVWpNUUFFWWh4WXJFU25Bem93SHFEQlJZdXlaSkY0cVJpVXczN2xPbzRL?=
 =?utf-8?B?NkdvaXFEc1M3UkZYR296UGpERkF2aU5sUlBiVVA4bVhJUXNzT2ZRS0R6V0FU?=
 =?utf-8?B?VVhxYlpUT0dBd1pMaTBMTEoxQXppa2d0Q25iaWQ4bVN4aCt0OTQrR1NKR0kz?=
 =?utf-8?B?bXNjR0o3VGJMNnFMemVXeGFpZlZQQmJxZm1FblhOSE1iQVJ2T3NidWI2eEhS?=
 =?utf-8?B?dk1kNDdFcHE5VGdLWlRYWjRzbU52Mk5BZjhnU3dSRVlka0thbGdJd2ZPWFNI?=
 =?utf-8?B?VGFsYkJ3Q0ZqYlBGRzN4SUVDMWhCeUhtWFE1ZVZob2J0OFBsYmFTU1ZncXNx?=
 =?utf-8?B?cVV6TUczaFFYNE1zbEhsWEZXQTJZWnZwUVZNL3crUHY3cDlIWWoyZERDQk1w?=
 =?utf-8?B?SHQzTGRGTE1obGR6L0lzN1FWMlV6amJvTzJENmw4bVF4dXpzQ3VoeWdmeEV4?=
 =?utf-8?B?eTFRU2I4N3BsU0tWbFM0aStoM3dsOVpGUmNFL3ZpSTNFNFVpRDAxYnFsbXVx?=
 =?utf-8?B?aWZzZkZKK0lmbG5idGZaWXhPd1E0MXgzVGF6Z2VhalozbXUwaEFCc0xLVXY1?=
 =?utf-8?B?QTk3anliQkNNUkphUnkwbm8rUmxxcnU2WFJaSTBzdUE4eXkxWDRqeUtZazV6?=
 =?utf-8?B?UWRzS3Fvc0MxNGdXV0Y3OXdqWjVXT2tmcXo1bURoTXprNFV4bFVpZ2pSakZ1?=
 =?utf-8?B?bmFEWkxFVGIrRTBmRmdBQTdxYS83K0hFWjRlMENOZjA0T1pWa0JLL1hORng4?=
 =?utf-8?B?Ky9FRE1Hcmg3UnAwVStVTVl0WTk5SUltbDlHb2dENGl1K0ZHd2k0Q3FNNG1N?=
 =?utf-8?B?OUFFcXVNdm0xMXdWUEo3WGZUMld5UTNXWm9lOTkxOHlNTWNxOHBKR2JvRzVw?=
 =?utf-8?B?cnZoYzNFdnk5T09Jc0N5MWVJVkFxWXpsWmIxKzZLeUFrcldFazVucFpRallT?=
 =?utf-8?B?OUV4dk9pS3ZJczNnNGdTa3NzRE9kbXluTWdLMUFDeWlGVkZCQTR4RTIzNHZ5?=
 =?utf-8?B?TDlMZlFVUzA1M25CVUlpV21BZnBtN0JxU3VYZGMyMXo1YXYyYzBUREhJUFdE?=
 =?utf-8?B?Vk9SeEhNZ2dyMG1sVVpGQ3hCRkg5OGY2cGxDdDJLS25zMXdRRklGRlRtNTVZ?=
 =?utf-8?B?NzlBTTR2YzZUd2ZlS29SaHJPSnZwaFVRYUdTKzkzQWNOWnYzb2YvTVZFb2ty?=
 =?utf-8?B?Ly9NUTJMeEdZOUZOcTc1MzhscXJmSDFINzE5NXVwcmVrV0FxUW56ZmxrRER2?=
 =?utf-8?B?SlY1MjdwWlZoenVNdkpMYWE4dlRWK1hzQTAwU1d6TmZvR3dSLzFBRjhtRkZV?=
 =?utf-8?B?TVd5eCtHMWxFK2ZxU2hKWXVqU1JRaGNKcWFZWUhwdjlDdHkwUVg5Rm8xNVFG?=
 =?utf-8?B?ZkxOSGk0MkZaM0NZaUxNQjJtQXZrTGFGZnBMOTdZbTNsV0pFQnJwdnBORlZy?=
 =?utf-8?B?dmRnKzFXaFJFWW9qS1RMU1BuREFJUzNHVWFETVdPQXBkVUVCY0VoYXk5TjhV?=
 =?utf-8?B?aFNpaDlBTHp6OXNGYUNsdkovWmVoRzR4MW1yL0tTdGdnbEd0cTM2ZjczYkhL?=
 =?utf-8?B?MUJ0aVQxOXBtU0JLRjZXR1ZieXpNc1l3MXc3UEpRcVNJSlB5MFUvb0pTTFV5?=
 =?utf-8?B?TTd0VUxzRUZCaElGT09vSCs0YkFMTDlJc1VNdWd2bC9HN1RYaWgvaWdDME5r?=
 =?utf-8?B?cG1uUjdxdDNiZzlTVmp3cWJXMjVoWGhWR05JeGhMWUpYZGVHSlVsNEN0WklX?=
 =?utf-8?B?amkvNGdYU3dDckRBLytIYkErYW9oa0lNb3VQRjJ5blpJbHVrTmROK3lVT2o5?=
 =?utf-8?B?SE9UWEZUSzJYRkFxbm81STRPbHJmVFNwQ0V1TjZwRVhkSmh6dmhvdTd0cHZJ?=
 =?utf-8?B?QXVDMFMzN2Y3bjlpazYzZ3FSZDB1MEZHTHVOZlFKRFN2dzh6ZlZvSXNWUjRr?=
 =?utf-8?B?MC9NTXZ6S2NkZk84R0lWSXZrczdiYzNSS1RIZUt5L0ZUeDV2QlFGV0l3Rkc0?=
 =?utf-8?Q?RVHsWrEYehEc154ajVKR3snRUZW1i4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TY1PPF33E28B4E6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTNlU2dBSURqRm80anRKbjRYRTA2RVQrbjM4QysyWDE3dUtrSjI1Rk5LRGRn?=
 =?utf-8?B?Y0dxRy94MW9ieloybVdLczRxdCtFWk9OcVpsNS8wVXFQaGsxQzJtd1Nsbytz?=
 =?utf-8?B?OGRoYlRNb3BaK1pmZDBUbXZOZHBLM3hTTWhaM1VBMmQ3WktZUk9LMXBLODZ5?=
 =?utf-8?B?OTFTYXBVZi9Teng1M0ZJQ2NaU3hJUkhUSTZLL1Y2eDdhbUlSZDcvUkZzajRh?=
 =?utf-8?B?NDBCMzFJUlhBQkxSNTRaWmtuS0JCb2hEQ1NiRWhMamZ0eWVJUGJUaDJVVjlJ?=
 =?utf-8?B?MUZiWHNsbWRSenpuYktWWWxxWEtKWUFkYi9xNmhHMUY5aGdOaXY1QnlCV3Fh?=
 =?utf-8?B?QmkwdElyNmdJMlVKRXNrKzlVdThKTmNCVE9najlmSUdreVFncGNKQmVoejFi?=
 =?utf-8?B?RTRhNTF2dXk3SU5vRlNOdWNzMlljK1ZuY3FXZGhTck9McEhhdDF3d1FTS2N5?=
 =?utf-8?B?VXNuYi9OWkZ4OVJack9PaC9VR2VTbnBkZmI2aTVXa0pZa2dqNG9vR056ZXNV?=
 =?utf-8?B?R1JsYkduT0drQmVtZ2EwUVNZWkJ4NUQ4aGNhTVF5UTMrVkhUL1AvOFV4OXNr?=
 =?utf-8?B?WCt1MURKam9iUnhhVUY2Tm5pOVU0cjZwRjVidDFkZzRoeXZ6STE0VVhTTGVB?=
 =?utf-8?B?R01FVGlBMkd1aGxYSzIyVnhvYngyV05xL1d2RXM3dVVSRzRpa3BEbHEzS1ZL?=
 =?utf-8?B?V2pGbTJ2Q0pQNW1vRTZJeEJjS1ZKalRjNHVpMy9NS1V2bFE2bCtObytwQ0tB?=
 =?utf-8?B?K0JjY0krdDJXcEl6Q3daSENyVGRoWENuQWxmeGJFQnovN290T3d5aTBPK2FL?=
 =?utf-8?B?aXNoWHhzSXFyQ0ErczJNOTVxSnpmeGJRY3ptbDFNczM2cWQrWnFEaFQ0RGw3?=
 =?utf-8?B?b05xQlY2V1duOWNCNzhvMWhzTVF2dk90R2pCUUNUWDJKRUlUV3dHNDJqV3Jt?=
 =?utf-8?B?dEJOT2x5Q3V5V1lYU2UzR3RWNkNuRjAzQWQ4Wk5EWng5WFdNd1JZN2FGWVZG?=
 =?utf-8?B?YTZ3Zm0zNFlUTmQrT0FsVFFid2lBeTNpVGhNbUF0Tzlpc1ZPODBNQzN3dSsx?=
 =?utf-8?B?MjUyV0NtZnZGdG9LQjFrKzRDcmxwYkc2MDgrb0dTcUwySTdGa0xQQk5DUE1q?=
 =?utf-8?B?aXgrUWtJeUNRQXJ2MUxNc2NMd01ZbExZdVpzQU9aU2dmVVUybHROZmhhVC94?=
 =?utf-8?B?SHhpTk9SR3E1dlJFalZJbm9UTmFFUmlMa0FoY1F5UUxYbnFGSDJZMVRaSzBp?=
 =?utf-8?B?aVVlRTliOTdWNTJ0V2c4WlA3UVRab2RHS1Avck1qZEJHdFYvV20xbk1rS29p?=
 =?utf-8?B?Y3RnQzJtY09CQWptbmM3OTJVZ0s1dTI5R1NCVGZUOUc1S0hUVVpsYjA0Wk45?=
 =?utf-8?B?UUtxVEoyUWE0SWhlQWlmL3UrQkNSajNGUXA3UHUzdmphN05QcTlJRGlPZzVW?=
 =?utf-8?B?MUFLSzVhUWpGdmFhbDNvNk9IeGJ4dGhyakVERmZsWmM5azF2UktkRDdNS3JC?=
 =?utf-8?B?anR3bTNTRkwvQmErU3dMRndUQ0N1c253Um5PaE9YZW01eUdRZkE2am9xbGhX?=
 =?utf-8?B?cXMyU3Qza1BEZ1FQdjE3Qm1tUWJ1T09PQWdTa05GS3hkMzZmV3RBbDJMajJp?=
 =?utf-8?B?d0xKTmNiOW82VGhNSEZEWlZKQWVPLzllSGt3MDVpbnZBa1VqcXA5RlkrR0Qw?=
 =?utf-8?B?cFNad3lZRVpwSkJvWXN3NG43bkU3UXZiNk1RV2MwRk0zdm5yNXA0QS94SzE3?=
 =?utf-8?B?L05pOWp4TzJqWlovZHNrWTk5S05QSWt6YjZqNVVKbXhSdzEzcGE1dFlRZUZS?=
 =?utf-8?B?cTFUU054SmlZejhmOHdNUnVZbFVNTVFyZ2hFT0pXWDFPMkJQcjhUNTk5ODIr?=
 =?utf-8?B?TW82blk0Rk1sT0RqK09YMVZXbjc5Nzd6UDBCZVJhelBpVzFVZUxadk03c2N5?=
 =?utf-8?B?eENORUJWVzdQY25HSkJ2WHA0U0R3OTRNYThQMkVFMHByNjQ3K0VaUDBzY1RJ?=
 =?utf-8?B?K2V0WFBBbTlIdVZuQjIvSzUyUGsrZUVRa2ErOFpNc3NsdUNIQnVRKzB2ZTBr?=
 =?utf-8?B?eGxrVEthTzJjYjVjVTFzNzJxWVBMSVdub0JIdGZMRnZyQTVHVjNmcEUzNkVv?=
 =?utf-8?Q?2ozo=3D?=
Content-ID: <75ED46AB14726746AA27DAEEE827D59B@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY1PPF33E28B4E6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5952fc-d9f0-468d-e71a-08ddd66f8546
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 11:34:22.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFo43ApoqvTNidtBKoipFSXCoNPNjUu3SkFKBmi1WolnSGvT+7YP5+5LgK9sX9AcEj6WQjosy0sASgCKlu9x/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6325
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 8/8/2025 6:57 AM, Jaegeuk Kim 写道: > By the way, can
    we also add some testcases in xfstests to check all this > works as intended?
    Thank you for the suggestion. I'll consider it further and add relevant testcases
    in xfstests if possible. 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.60 listed in wl.mailspike.net]
X-Headers-End: 1ukLMr-0004it-Vo
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: add reserved nodes for privileged
 users
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDgvOC8yMDI1IDY6NTcgQU0sIEphZWdldWsgS2ltIOWGmemBkzoNCj4gQnkgdGhlIHdheSwg
Y2FuIHdlIGFsc28gYWRkIHNvbWUgdGVzdGNhc2VzIGluIHhmc3Rlc3RzIHRvIGNoZWNrIGFsbCB0
aGlzDQo+IHdvcmtzIGFzIGludGVuZGVkPw0KDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rp
b24uIEknbGwgY29uc2lkZXIgaXQgZnVydGhlciBhbmQgYWRkIHJlbGV2YW50IA0KdGVzdGNhc2Vz
IGluIHhmc3Rlc3RzIGlmIHBvc3NpYmxlLg0KDQpUaGFua3MsDQoNCj4NCj4gT24gMDgvMDcsIENo
dW5oYWkgR3VvIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBhbGxvd3MgcHJpdmlsZWdlZCB1c2VycyB0
byByZXNlcnZlIG5vZGVzIHZpYSB0aGUNCj4+ICdyZXNlcnZlX25vZGUnIG1vdW50IG9wdGlvbiwg
d2hpY2ggaXMgc2ltaWxhciB0byB0aGUgZXhpc3RpbmcNCj4+ICdyZXNlcnZlX3Jvb3QnIG9wdGlv
bi4NCj4+DQo+PiAiLW8gcmVzZXJ2ZV9ub2RlPTxOPiIgbWVhbnMgPE4+IG5vZGVzIGFyZSByZXNl
cnZlZCBmb3IgcHJpdmlsZWdlZA0KPj4gdXNlcnMgb25seS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+IC0tLQ0KPj4gdjUtPnY2OiBN
b2RpZmllZCBGMkZTX1NQRUNfcmVzZXJ2ZV9ub2RlIGZyb20gKDE8PDI0KSB0byAoMTw8MjUpIGZv
bGxvd2luZyBaaGlndW8ncyBzdWdnZXN0aW9uIGluIHY1Lg0KPj4gdjQtPnY1OiBBcHBseSBDaGFv
J3Mgc3VnZ2VzdGlvbiBmcm9tIHY0Lg0KPj4gdjMtPnY0OiBSZWJhc2UgdGhpcyBwYXRjaCBvbiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwNzMxMDYwMzM4LjEx
MzYwODYtMS1jaGFvQGtlcm5lbC5vcmcNCj4+IHYyLT52MzogQXBwbHkgQ2hhbydzIHN1Z2dlc3Rp
b24gZnJvbSB2Mi4NCj4+IHYxLT52MjogQWRkIHR3byBtaXNzaW5nIGhhbmRsaW5nIHBhcnRzLg0K
Pj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNTA3Mjkw
OTUyMzguNjA3NDMzLTEtZ3VvY2h1bmhhaUB2aXZvLmNvbS8NCj4+IC0tLQ0KPj4gICBEb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IHwgIDkgKysrKy0tLQ0KPj4gICBmcy9mMmZzL2Yy
ZnMuaCAgICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKystLS0tDQo+PiAgIGZzL2YyZnMv
c3VwZXIuYyAgICAgICAgICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0NCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZz
LnJzdCBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QNCj4+IGluZGV4IDVjYWQz
NjljZWI5Mi4uZTA2Y2JiODIzYmI3IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9maWxl
c3lzdGVtcy9mMmZzLnJzdA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZz
LnJzdA0KPj4gQEAgLTE3Myw5ICsxNzMsMTIgQEAgZGF0YV9mbHVzaAkJIEVuYWJsZSBkYXRhIGZs
dXNoaW5nIGJlZm9yZSBjaGVja3BvaW50IGluIG9yZGVyIHRvDQo+PiAgIAkJCSBwZXJzaXN0IGRh
dGEgb2YgcmVndWxhciBhbmQgc3ltbGluay4NCj4+ICAgcmVzZXJ2ZV9yb290PSVkCQkgU3VwcG9y
dCBjb25maWd1cmluZyByZXNlcnZlZCBzcGFjZSB3aGljaCBpcyB1c2VkIGZvcg0KPj4gICAJCQkg
YWxsb2NhdGlvbiBmcm9tIGEgcHJpdmlsZWdlZCB1c2VyIHdpdGggc3BlY2lmaWVkIHVpZCBvcg0K
Pj4gLQkJCSBnaWQsIHVuaXQ6IDRLQiwgdGhlIGRlZmF1bHQgbGltaXQgaXMgMC4yJSBvZiB1c2Vy
IGJsb2Nrcy4NCj4+IC1yZXN1aWQ9JWQJCSBUaGUgdXNlciBJRCB3aGljaCBtYXkgdXNlIHRoZSBy
ZXNlcnZlZCBibG9ja3MuDQo+PiAtcmVzZ2lkPSVkCQkgVGhlIGdyb3VwIElEIHdoaWNoIG1heSB1
c2UgdGhlIHJlc2VydmVkIGJsb2Nrcy4NCj4+ICsJCQkgZ2lkLCB1bml0OiA0S0IsIHRoZSBkZWZh
dWx0IGxpbWl0IGlzIDEyLjUlIG9mIHVzZXIgYmxvY2tzLg0KPj4gK3Jlc2VydmVfbm9kZT0lZAkJ
IFN1cHBvcnQgY29uZmlndXJpbmcgcmVzZXJ2ZWQgbm9kZXMgd2hpY2ggYXJlIHVzZWQgZm9yDQo+
PiArCQkJIGFsbG9jYXRpb24gZnJvbSBhIHByaXZpbGVnZWQgdXNlciB3aXRoIHNwZWNpZmllZCB1
aWQgb3INCj4+ICsJCQkgZ2lkLCB0aGUgZGVmYXVsdCBsaW1pdCBpcyAxMi41JSBvZiBhbGwgbm9k
ZXMuDQo+PiArcmVzdWlkPSVkCQkgVGhlIHVzZXIgSUQgd2hpY2ggbWF5IHVzZSB0aGUgcmVzZXJ2
ZWQgYmxvY2tzIGFuZCBub2Rlcy4NCj4+ICtyZXNnaWQ9JWQJCSBUaGUgZ3JvdXAgSUQgd2hpY2gg
bWF5IHVzZSB0aGUgcmVzZXJ2ZWQgYmxvY2tzIGFuZCBub2Rlcy4NCj4+ICAgZmF1bHRfaW5qZWN0
aW9uPSVkCSBFbmFibGUgZmF1bHQgaW5qZWN0aW9uIGluIGFsbCBzdXBwb3J0ZWQgdHlwZXMgd2l0
aA0KPj4gICAJCQkgc3BlY2lmaWVkIGluamVjdGlvbiByYXRlLg0KPj4gICBmYXVsdF90eXBlPSVk
CQkgU3VwcG9ydCBjb25maWd1cmluZyBmYXVsdCBpbmplY3Rpb24gdHlwZSwgc2hvdWxkIGJlDQo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaA0KPj4gaW5kZXgg
ZjE5NDcyZWIyNzg5Li4wNDc5NjRkNjY3MzYgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL2YyZnMu
aA0KPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgNCj4+IEBAIC0xMzEsNiArMTMxLDcgQEAgZXh0ZXJu
IGNvbnN0IGNoYXIgKmYyZnNfZmF1bHRfbmFtZVtGQVVMVF9NQVhdOw0KPj4gICAgKiBzdHJpbmcg
cmF0aGVyIHRoYW4gdXNpbmcgdGhlIE1TX0xBWllUSU1FIGZsYWcsIHNvIHRoaXMgbXVzdCByZW1h
aW4uDQo+PiAgICAqLw0KPj4gICAjZGVmaW5lIEYyRlNfTU9VTlRfTEFaWVRJTUUJCTB4NDAwMDAw
MDANCj4+ICsjZGVmaW5lIEYyRlNfTU9VTlRfUkVTRVJWRV9OT0RFCQkweDgwMDAwMDAwDQo+PiAg
IA0KPj4gICAjZGVmaW5lIEYyRlNfT1BUSU9OKHNiaSkJKChzYmkpLT5tb3VudF9vcHQpDQo+PiAg
ICNkZWZpbmUgY2xlYXJfb3B0KHNiaSwgb3B0aW9uKQkoRjJGU19PUFRJT04oc2JpKS5vcHQgJj0g
fkYyRlNfTU9VTlRfIyNvcHRpb24pDQo+PiBAQCAtMTc4LDYgKzE3OSw3IEBAIHN0cnVjdCBmMmZz
X3J3c2VtIHsNCj4+ICAgc3RydWN0IGYyZnNfbW91bnRfaW5mbyB7DQo+PiAgIAl1bnNpZ25lZCBp
bnQgb3B0Ow0KPj4gICAJYmxvY2tfdCByb290X3Jlc2VydmVkX2Jsb2NrczsJLyogcm9vdCByZXNl
cnZlZCBibG9ja3MgKi8NCj4+ICsJYmxvY2tfdCByb290X3Jlc2VydmVkX25vZGVzOwkvKiByb290
IHJlc2VydmVkIG5vZGVzICovDQo+PiAgIAlrdWlkX3Qgc19yZXN1aWQ7CQkvKiByZXNlcnZlZCBi
bG9ja3MgZm9yIHVpZCAqLw0KPj4gICAJa2dpZF90IHNfcmVzZ2lkOwkJLyogcmVzZXJ2ZWQgYmxv
Y2tzIGZvciBnaWQgKi8NCj4+ICAgCWludCBhY3RpdmVfbG9nczsJCS8qICMgb2YgYWN0aXZlIGxv
Z3MgKi8NCj4+IEBAIC0yNDA3LDcgKzI0MDksNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19o
YXNfeGF0dHJfYmxvY2sodW5zaWduZWQgaW50IG9mcykNCj4+ICAgCXJldHVybiBvZnMgPT0gWEFU
VFJfTk9ERV9PRkZTRVQ7DQo+PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIGlubGluZSBib29sIF9f
YWxsb3dfcmVzZXJ2ZWRfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+ICtzdGF0
aWMgaW5saW5lIGJvb2wgX19hbGxvd19yZXNlcnZlZF9yb290KHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwNCj4+ICAgCQkJCQlzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIGNhcCkNCj4+ICAgew0K
Pj4gICAJaWYgKCFpbm9kZSkNCj4+IEBAIC0yNDMyLDcgKzI0MzQsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGludCBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50KHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwNCj4+ICAgCWF2YWlsX3VzZXJfYmxvY2tfY291bnQgPSBzYmktPnVzZXJfYmxvY2tf
Y291bnQgLQ0KPj4gICAJCQkJCXNiaS0+Y3VycmVudF9yZXNlcnZlZF9ibG9ja3M7DQo+PiAgIA0K
Pj4gLQlpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX1JPT1QpICYmICFfX2FsbG93X3Jlc2VydmVk
X2Jsb2NrcyhzYmksIGlub2RlLCBjYXApKQ0KPj4gKwlpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZF
X1JPT1QpICYmICFfX2FsbG93X3Jlc2VydmVkX3Jvb3Qoc2JpLCBpbm9kZSwgY2FwKSkNCj4+ICAg
CQlhdmFpbF91c2VyX2Jsb2NrX2NvdW50IC09IEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZl
ZF9ibG9ja3M7DQo+PiAgIA0KPj4gICAJaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmks
IFNCSV9DUF9ESVNBQkxFRCkpKSB7DQo+PiBAQCAtMjc5MCw3ICsyNzkyLDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgaW5jX3ZhbGlkX25vZGVfY291bnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0K
Pj4gICAJCQkJCXN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgaXNfaW5vZGUpDQo+PiAgIHsNCj4+
ICAgCWJsb2NrX3QJdmFsaWRfYmxvY2tfY291bnQ7DQo+PiAtCXVuc2lnbmVkIGludCB2YWxpZF9u
b2RlX2NvdW50Ow0KPj4gKwl1bnNpZ25lZCBpbnQgdmFsaWRfbm9kZV9jb3VudCwgYXZhaWxfdXNl
cl9ub2RlX2NvdW50Ow0KPj4gICAJdW5zaWduZWQgaW50IGF2YWlsX3VzZXJfYmxvY2tfY291bnQ7
DQo+PiAgIAlpbnQgZXJyOw0KPj4gICANCj4+IEBAIC0yODEyLDE1ICsyODE0LDIwIEBAIHN0YXRp
YyBpbmxpbmUgaW50IGluY192YWxpZF9ub2RlX2NvdW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwNCj4+ICAgCXNwaW5fbG9jaygmc2JpLT5zdGF0X2xvY2spOw0KPj4gICANCj4+ICAgCXZhbGlk
X2Jsb2NrX2NvdW50ID0gc2JpLT50b3RhbF92YWxpZF9ibG9ja19jb3VudCArIDE7DQo+PiAtCWF2
YWlsX3VzZXJfYmxvY2tfY291bnQgPSBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50KHNiaSwgaW5v
ZGUsIGZhbHNlKTsNCj4+ICsJYXZhaWxfdXNlcl9ibG9ja19jb3VudCA9IGdldF9hdmFpbGFibGVf
YmxvY2tfY291bnQoc2JpLCBpbm9kZSwNCj4+ICsJCQl0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9E
RSkpOw0KPj4gICANCj4+ICAgCWlmICh1bmxpa2VseSh2YWxpZF9ibG9ja19jb3VudCA+IGF2YWls
X3VzZXJfYmxvY2tfY291bnQpKSB7DQo+PiAgIAkJc3Bpbl91bmxvY2soJnNiaS0+c3RhdF9sb2Nr
KTsNCj4+ICAgCQlnb3RvIGVub3NwYzsNCj4+ICAgCX0NCj4+ICAgDQo+PiArCWF2YWlsX3VzZXJf
bm9kZV9jb3VudCA9IHNiaS0+dG90YWxfbm9kZV9jb3VudCAtIEYyRlNfUkVTRVJWRURfTk9ERV9O
VU07DQo+PiArCWlmICh0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9ERSkgJiYNCj4+ICsJCQkhX19h
bGxvd19yZXNlcnZlZF9yb290KHNiaSwgaW5vZGUsIHRydWUpKQ0KPj4gKwkJYXZhaWxfdXNlcl9u
b2RlX2NvdW50IC09IEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ub2RlczsNCj4+ICAg
CXZhbGlkX25vZGVfY291bnQgPSBzYmktPnRvdGFsX3ZhbGlkX25vZGVfY291bnQgKyAxOw0KPj4g
LQlpZiAodW5saWtlbHkodmFsaWRfbm9kZV9jb3VudCA+IHNiaS0+dG90YWxfbm9kZV9jb3VudCkp
IHsNCj4+ICsJaWYgKHVubGlrZWx5KHZhbGlkX25vZGVfY291bnQgPiBhdmFpbF91c2VyX25vZGVf
Y291bnQpKSB7DQo+PiAgIAkJc3Bpbl91bmxvY2soJnNiaS0+c3RhdF9sb2NrKTsNCj4+ICAgCQln
b3RvIGVub3NwYzsNCj4+ICAgCX0NCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMNCj4+IGluZGV4IDNmOGJjNDJlMDk2OC4uZjM3MDA0NzgwY2UwIDEwMDY0
NA0KPj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jDQo+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMNCj4+
IEBAIC0xNDMsNiArMTQzLDcgQEAgZW51bSB7DQo+PiAgIAlPcHRfZXh0ZW50X2NhY2hlLA0KPj4g
ICAJT3B0X2RhdGFfZmx1c2gsDQo+PiAgIAlPcHRfcmVzZXJ2ZV9yb290LA0KPj4gKwlPcHRfcmVz
ZXJ2ZV9ub2RlLA0KPj4gICAJT3B0X3Jlc2dpZCwNCj4+ICAgCU9wdF9yZXN1aWQsDQo+PiAgIAlP
cHRfbW9kZSwNCj4+IEBAIC0yNzMsNiArMjc0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmc19w
YXJhbWV0ZXJfc3BlYyBmMmZzX3BhcmFtX3NwZWNzW10gPSB7DQo+PiAgIAlmc3BhcmFtX2ZsYWdf
bm8oImV4dGVudF9jYWNoZSIsIE9wdF9leHRlbnRfY2FjaGUpLA0KPj4gICAJZnNwYXJhbV9mbGFn
KCJkYXRhX2ZsdXNoIiwgT3B0X2RhdGFfZmx1c2gpLA0KPj4gICAJZnNwYXJhbV91MzIoInJlc2Vy
dmVfcm9vdCIsIE9wdF9yZXNlcnZlX3Jvb3QpLA0KPj4gKwlmc3BhcmFtX3UzMigicmVzZXJ2ZV9u
b2RlIiwgT3B0X3Jlc2VydmVfbm9kZSksDQo+PiAgIAlmc3BhcmFtX2dpZCgicmVzZ2lkIiwgT3B0
X3Jlc2dpZCksDQo+PiAgIAlmc3BhcmFtX3VpZCgicmVzdWlkIiwgT3B0X3Jlc3VpZCksDQo+PiAg
IAlmc3BhcmFtX2VudW0oIm1vZGUiLCBPcHRfbW9kZSwgZjJmc19wYXJhbV9tb2RlKSwNCj4+IEBA
IC0zNDYsNiArMzQ4LDcgQEAgc3RhdGljIG1hdGNoX3RhYmxlX3QgZjJmc19jaGVja3BvaW50X3Rv
a2VucyA9IHsNCj4+ICAgI2RlZmluZSBGMkZTX1NQRUNfbWVtb3J5X21vZGUJCQkoMSA8PCAyMikN
Cj4+ICAgI2RlZmluZSBGMkZTX1NQRUNfZXJyb3JzCQkJKDEgPDwgMjMpDQo+PiAgICNkZWZpbmUg
RjJGU19TUEVDX2xvb2t1cF9tb2RlCQkJKDEgPDwgMjQpDQo+PiArI2RlZmluZSBGMkZTX1NQRUNf
cmVzZXJ2ZV9ub2RlCQkJKDEgPDwgMjUpDQo+PiAgIA0KPj4gICBzdHJ1Y3QgZjJmc19mc19jb250
ZXh0IHsNCj4+ICAgCXN0cnVjdCBmMmZzX21vdW50X2luZm8gaW5mbzsNCj4+IEBAIC00NDcsMjIg
KzQ1MCwzMCBAQCBzdGF0aWMgdm9pZCBmMmZzX2Rlc3Ryb3lfY2FzZWZvbGRfY2FjaGUodm9pZCkg
eyB9DQo+PiAgIA0KPj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbGltaXRfcmVzZXJ2ZV9yb290KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkNCj4+ICAgew0KPj4gLQlibG9ja190IGxpbWl0ID0gbWlu
KChzYmktPnVzZXJfYmxvY2tfY291bnQgPj4gMyksDQo+PiArCWJsb2NrX3QgYmxvY2tfbGltaXQg
PSBtaW4oKHNiaS0+dXNlcl9ibG9ja19jb3VudCA+PiAzKSwNCj4+ICAgCQkJc2JpLT51c2VyX2Js
b2NrX2NvdW50IC0gc2JpLT5yZXNlcnZlZF9ibG9ja3MpOw0KPj4gKwlibG9ja190IG5vZGVfbGlt
aXQgPSBzYmktPnRvdGFsX25vZGVfY291bnQgPj4gMzsNCj4+ICAgDQo+PiAgIAkvKiBsaW1pdCBp
cyAxMi41JSAqLw0KPj4gICAJaWYgKHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9ST09UKSAmJg0KPj4g
LQkJCUYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3MgPiBsaW1pdCkgew0KPj4g
LQkJRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcyA9IGxpbWl0Ow0KPj4gKwkJ
CUYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3MgPiBibG9ja19saW1pdCkgew0K
Pj4gKwkJRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcyA9IGJsb2NrX2xpbWl0
Ow0KPj4gICAJCWYyZnNfaW5mbyhzYmksICJSZWR1Y2UgcmVzZXJ2ZWQgYmxvY2tzIGZvciByb290
ID0gJXUiLA0KPj4gICAJCQkgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3Mp
Ow0KPj4gICAJfQ0KPj4gLQlpZiAoIXRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9ST09UKSAmJg0KPj4g
KwlpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX05PREUpICYmDQo+PiArCQkJRjJGU19PUFRJT04o
c2JpKS5yb290X3Jlc2VydmVkX25vZGVzID4gbm9kZV9saW1pdCkgew0KPj4gKwkJRjJGU19PUFRJ
T04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVzID0gbm9kZV9saW1pdDsNCj4+ICsJCWYyZnNfaW5m
byhzYmksICJSZWR1Y2UgcmVzZXJ2ZWQgbm9kZXMgZm9yIHJvb3QgPSAldSIsDQo+PiArCQkJICBG
MkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfbm9kZXMpOw0KPj4gKwl9DQo+PiArCWlmICgh
dGVzdF9vcHQoc2JpLCBSRVNFUlZFX1JPT1QpICYmICF0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9E
RSkgJiYNCj4+ICAgCQkoIXVpZF9lcShGMkZTX09QVElPTihzYmkpLnNfcmVzdWlkLA0KPj4gICAJ
CQkJbWFrZV9rdWlkKCZpbml0X3VzZXJfbnMsIEYyRlNfREVGX1JFU1VJRCkpIHx8DQo+PiAgIAkJ
IWdpZF9lcShGMkZTX09QVElPTihzYmkpLnNfcmVzZ2lkLA0KPj4gICAJCQkJbWFrZV9rZ2lkKCZp
bml0X3VzZXJfbnMsIEYyRlNfREVGX1JFU0dJRCkpKSkNCj4+IC0JCWYyZnNfaW5mbyhzYmksICJJ
Z25vcmUgc19yZXN1aWQ9JXUsIHNfcmVzZ2lkPSV1IHcvbyByZXNlcnZlX3Jvb3QiLA0KPj4gKwkJ
ZjJmc19pbmZvKHNiaSwgIklnbm9yZSBzX3Jlc3VpZD0ldSwgc19yZXNnaWQ9JXUgdy9vIHJlc2Vy
dmVfcm9vdCINCj4+ICsJCQkJIiBhbmQgcmVzZXJ2ZV9ub2RlIiwNCj4+ICAgCQkJICBmcm9tX2t1
aWRfbXVuZ2VkKCZpbml0X3VzZXJfbnMsDQo+PiAgIAkJCQkJICAgRjJGU19PUFRJT04oc2JpKS5z
X3Jlc3VpZCksDQo+PiAgIAkJCSAgZnJvbV9rZ2lkX211bmdlZCgmaW5pdF91c2VyX25zLA0KPj4g
QEAgLTg1MSw2ICs4NjIsMTEgQEAgc3RhdGljIGludCBmMmZzX3BhcnNlX3BhcmFtKHN0cnVjdCBm
c19jb250ZXh0ICpmYywgc3RydWN0IGZzX3BhcmFtZXRlciAqcGFyYW0pDQo+PiAgIAkJRjJGU19D
VFhfSU5GTyhjdHgpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzID0gcmVzdWx0LnVpbnRfMzI7DQo+PiAg
IAkJY3R4LT5zcGVjX21hc2sgfD0gRjJGU19TUEVDX3Jlc2VydmVfcm9vdDsNCj4+ICAgCQlicmVh
azsNCj4+ICsJY2FzZSBPcHRfcmVzZXJ2ZV9ub2RlOg0KPj4gKwkJY3R4X3NldF9vcHQoY3R4LCBG
MkZTX01PVU5UX1JFU0VSVkVfTk9ERSk7DQo+PiArCQlGMkZTX0NUWF9JTkZPKGN0eCkucm9vdF9y
ZXNlcnZlZF9ub2RlcyA9IHJlc3VsdC51aW50XzMyOw0KPj4gKwkJY3R4LT5zcGVjX21hc2sgfD0g
RjJGU19TUEVDX3Jlc2VydmVfbm9kZTsNCj4+ICsJCWJyZWFrOw0KPj4gICAJY2FzZSBPcHRfcmVz
dWlkOg0KPj4gICAJCUYyRlNfQ1RYX0lORk8oY3R4KS5zX3Jlc3VpZCA9IHJlc3VsdC51aWQ7DQo+
PiAgIAkJY3R4LT5zcGVjX21hc2sgfD0gRjJGU19TUEVDX3Jlc3VpZDsNCj4+IEBAIC0xNDM4LDYg
KzE0NTQsMTQgQEAgc3RhdGljIGludCBmMmZzX2NoZWNrX29wdF9jb25zaXN0ZW5jeShzdHJ1Y3Qg
ZnNfY29udGV4dCAqZmMsDQo+PiAgIAkJY3R4X2NsZWFyX29wdChjdHgsIEYyRlNfTU9VTlRfUkVT
RVJWRV9ST09UKTsNCj4+ICAgCQljdHgtPm9wdF9tYXNrICY9IH5GMkZTX01PVU5UX1JFU0VSVkVf
Uk9PVDsNCj4+ICAgCX0NCj4+ICsJaWYgKHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9OT0RFKSAmJg0K
Pj4gKwkJCShjdHgtPm9wdF9tYXNrICYgRjJGU19NT1VOVF9SRVNFUlZFX05PREUpICYmDQo+PiAr
CQkJY3R4X3Rlc3Rfb3B0KGN0eCwgRjJGU19NT1VOVF9SRVNFUlZFX05PREUpKSB7DQo+PiArCQlm
MmZzX2luZm8oc2JpLCAiUHJlc2VydmUgcHJldmlvdXMgcmVzZXJ2ZV9ub2RlPSV1IiwNCj4+ICsJ
CQlGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfbm9kZXMpOw0KPj4gKwkJY3R4X2NsZWFy
X29wdChjdHgsIEYyRlNfTU9VTlRfUkVTRVJWRV9OT0RFKTsNCj4+ICsJCWN0eC0+b3B0X21hc2sg
Jj0gfkYyRlNfTU9VTlRfUkVTRVJWRV9OT0RFOw0KPj4gKwl9DQo+PiAgIA0KPj4gICAJZXJyID0g
ZjJmc19jaGVja190ZXN0X2R1bW15X2VuY3J5cHRpb24oZmMsIHNiKTsNCj4+ICAgCWlmIChlcnIp
DQo+PiBAQCAtMTYzNyw2ICsxNjYxLDkgQEAgc3RhdGljIHZvaWQgZjJmc19hcHBseV9vcHRpb25z
KHN0cnVjdCBmc19jb250ZXh0ICpmYywgc3RydWN0IHN1cGVyX2Jsb2NrICpzYikNCj4+ICAgCWlm
IChjdHgtPnNwZWNfbWFzayAmIEYyRlNfU1BFQ19yZXNlcnZlX3Jvb3QpDQo+PiAgIAkJRjJGU19P
UFRJT04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcyA9DQo+PiAgIAkJCQkJRjJGU19DVFhfSU5G
TyhjdHgpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzOw0KPj4gKwlpZiAoY3R4LT5zcGVjX21hc2sgJiBG
MkZTX1NQRUNfcmVzZXJ2ZV9ub2RlKQ0KPj4gKwkJRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2Vy
dmVkX25vZGVzID0NCj4+ICsJCQkJCUYyRlNfQ1RYX0lORk8oY3R4KS5yb290X3Jlc2VydmVkX25v
ZGVzOw0KPj4gICAJaWYgKGN0eC0+c3BlY19tYXNrICYgRjJGU19TUEVDX3Jlc2dpZCkNCj4+ICAg
CQlGMkZTX09QVElPTihzYmkpLnNfcmVzZ2lkID0gRjJGU19DVFhfSU5GTyhjdHgpLnNfcmVzZ2lk
Ow0KPj4gICAJaWYgKGN0eC0+c3BlY19tYXNrICYgRjJGU19TUEVDX3Jlc3VpZCkNCj4+IEBAIC0y
MzU5LDkgKzIzODYsMTEgQEAgc3RhdGljIGludCBmMmZzX3Nob3dfb3B0aW9ucyhzdHJ1Y3Qgc2Vx
X2ZpbGUgKnNlcSwgc3RydWN0IGRlbnRyeSAqcm9vdCkNCj4+ICAgCWVsc2UgaWYgKEYyRlNfT1BU
SU9OKHNiaSkuZnNfbW9kZSA9PSBGU19NT0RFX0ZSQUdNRU5UX0JMSykNCj4+ICAgCQlzZXFfcHV0
cyhzZXEsICJmcmFnbWVudDpibG9jayIpOw0KPj4gICAJc2VxX3ByaW50ZihzZXEsICIsYWN0aXZl
X2xvZ3M9JXUiLCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsNCj4+IC0JaWYgKHRlc3Rf
b3B0KHNiaSwgUkVTRVJWRV9ST09UKSkNCj4+IC0JCXNlcV9wcmludGYoc2VxLCAiLHJlc2VydmVf
cm9vdD0ldSxyZXN1aWQ9JXUscmVzZ2lkPSV1IiwNCj4+ICsJaWYgKHRlc3Rfb3B0KHNiaSwgUkVT
RVJWRV9ST09UKSB8fCB0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9ERSkpDQo+PiArCQlzZXFfcHJp
bnRmKHNlcSwgIixyZXNlcnZlX3Jvb3Q9JXUscmVzZXJ2ZV9ub2RlPSV1LHJlc3VpZD0ldSwiDQo+
PiArCQkJCSJyZXNnaWQ9JXUiLA0KPj4gICAJCQkJRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2Vy
dmVkX2Jsb2NrcywNCj4+ICsJCQkJRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVz
LA0KPj4gICAJCQkJZnJvbV9rdWlkX211bmdlZCgmaW5pdF91c2VyX25zLA0KPj4gICAJCQkJCUYy
RlNfT1BUSU9OKHNiaSkuc19yZXN1aWQpLA0KPj4gICAJCQkJZnJvbV9rZ2lkX211bmdlZCgmaW5p
dF91c2VyX25zLA0KPj4gLS0gDQo+PiAyLjM0LjENCg0KDQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
